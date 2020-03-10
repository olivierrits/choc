class BarsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bars = Bar.all
    user_signed_in? ? @user = current_user : @user = User.where(first_name: "anonymous").first
  end

  def show
    @bar = Bar.find(params[:id])
    @bar_reviews = @bar.bar_reviews
    user_signed_in? ? @user = current_user : @user = User.where(first_name: "anonymous").first
    if (Taste.where(user: @user, bar: @bar) == [])
      @taste = Taste.new(bar: @bar, user: @user)
      @taste.save!
    else
      @taste = Taste.where(user: @user, bar: @bar).last
      @taste.count += 1
      @taste.save!
    end
    @rating = 0
    if @bar_reviews.length != 0
      @bar_reviews.each do |bar_review|
        @rating += bar_review.rating
      end
      @rating /= @bar_reviews.length
    end
  end

  def search
    if params[:search].blank?
      redirect_to(bars_path, alert: "Empty field!") and return
    else
      sql_query = "name ILIKE :search OR origin ILIKE :search OR brand ILIKE :search OR ingredients ILIKE :search OR production ILIKE :search"
      @parameter = params[:search].downcase
      @results = Bar.where(sql_query, search: "%#{@parameter}%")
    end
  end

  def favourite
    @bar = Bar.find(params[:bar_id])
    if (user_signed_in?)
      @user = current_user
      if (Taste.where(user: @user, bar: @bar) == [])
        @taste = Taste.new(bar: @bar, user: @user, favourite: true)
        @taste.save!
      else
        @taste = Taste.where(user: @user, bar: @bar).last
        @taste.favourite = (@taste.favourite == false)
        @taste.save!
      end
    else
      flash.alert = "You need to be signed in to add to favourites"
    end
    # redirect_to bars_path
    respond_to do |format|
      format.html { redirect_to bars_path }
      format.js  # <-- will render `app/views/bars/favourite.js.erb`
    end
  end
end
