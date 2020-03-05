class BarReviewsController < ApplicationController
  before_action :set_bar_review, only: :show

  def new
    @bar_review = BarReview.new
    @bar = Bar.find(params[:bar_id])
  end

  def create
    @bar = Bar.find(params[:bar_id])
    @bar_review = BarReview.new(bar_review_params)
    @bar_review.bar = @bar
    @bar_review.user = current_user
    if @bar_review.save
      redirect_to bar_path(@bar)
    else
      render 'bars/show'
    end
  end

  private

  def set_bar_review
    @bar_review = BarReview.find(params[:id])
  end

  def review_params
    params.require(:bar_review).permit(:content, :rating)
  end
end
