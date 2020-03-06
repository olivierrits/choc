class BarReviewsController < ApplicationController
  before_action :set_bar_review, only: :show
  before_action :set_bar
  before_action :authenticate_user!

  def new
    @bar_review = BarReview.new
  end

  def create
    @bar_review = BarReview.new(bar_review_params)
    visit = Visit.where(user: current_user, bar: @bar)
    @bar_review.visit = visit
    if @bar_review.save
      redirect_to bar_path(@bar)
    else
      render 'new'
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
