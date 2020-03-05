class ShopReviewsController < ApplicationController
  before_action :set_review, only: :show

  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @shop = Car.find(params[:shop_id])
    @review = Review.new(review_params)
    @review.shop = @shop
    @review.user = current_user
    if @review.save
      redirect_to shop_path(@shop)
    else
      render 'shops/show'
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
