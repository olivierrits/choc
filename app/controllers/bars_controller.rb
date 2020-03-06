class BarsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    @bar_reviews = @bar.bar_reviews
    if (Taste.where(user: current_user, bar: @bar) != [])
      @taste = Taste.new(bar: @bar, user: current_user)
      @taste.save!
    end
    @rating = 0
    @bar_reviews.each do |bar_review|
      @rating += bar_review.rating
    end
    @rating /= @bar.bar_reviews.length
  end
end
