class BarsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:search]

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
      @taste.counter += 1
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
    @results = Bar.all
    @results = @results.where(origin: params[:origins]) if params[:origins]
    @results = @results.where(beans: params[:beans]) if params[:beans]
    @results = @results.where(percentages_query) if params[:percentages]
    @results = @results.where(*search_query) if params[:search]
    @results = rating_query if params[:ratings]
    respond_to do |format|
      format.js  # <-- will render `app/views/bars/search.js.erb`
    end
  end

  def percentages_query
    query = []
    query << "(percentage >= 0 AND percentage < 25)" if params[:percentages].include?("0-25")
    query << "(percentage >= 25 AND percentage < 70)" if params[:percentages].include?("25-70")
    query << "(percentage >= 70 AND percentage <= 100)" if params[:percentages].include?("70-100")
    query.join(' OR ')
  end

  def search_query
    sql_query = "name ILIKE :search OR origin ILIKE :search OR brand ILIKE :search OR ingredients ILIKE :search OR production ILIKE :search"
    @parameter = params[:search].downcase
    [sql_query, search: "%#{@parameter}%"]
  end

  def rating_query
     @results.joins(:bar_reviews).group("bars.id").having("ROUND(AVG(bar_reviews.rating)) IN (?)", params[:ratings])
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
