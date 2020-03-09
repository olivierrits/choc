class BarReviewsController < ApplicationController
  before_action :set_bar_review, only: :show
  before_action :set_bar
  before_action :authenticate_user!

  def new
    @bar_review = BarReview.new
  end

  def create
    @bar_review = BarReview.new(bar_review_params)
    taste = Taste.where(user: current_user, bar: @bar)
    @bar_review.taste = @taste
    @bar_review.user_id = current_user.id
    @bar_review.bar_id = @bar.id
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

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def bar_review_params
    params.require(:bar_review).permit(:content, :rating)
  end
end
