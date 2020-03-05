class BarReviewsController < ApplicationController
  before_action :set_review, only: :show

  def new
    @review = Review.new
    @bar = Shop.find(params[:bar_id])
  end

  def create
    @bar = Car.find(params[:bar_id])
    @review = Review.new(review_params)
    @review.bar = @bar
    @review.user = current_user
    if @review.save
      redirect_to bar_path(@bar)
    else
      render 'bars/show'
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
