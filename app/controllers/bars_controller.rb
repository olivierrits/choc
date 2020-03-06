class BarsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    @bar_reviews = @bar.bar_reviews
    user_signed_in? ? @user = current_user : @user = User.where(first_name: "anonymous").first
    if (Taste.where(user: @user, bar: @bar) != [])
      @taste = Taste.new(bar: @bar, user: @user)
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
end
