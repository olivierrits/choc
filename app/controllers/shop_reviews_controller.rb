class ShopReviewsController < ApplicationController
  before_action :set_shop_review, only: :show, :authenticate_user!

  def new
    @shop_review = ShopReview.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @shop_review = ShopReview.new(shop_review_params)
    @shop_review.shop = @shop
    @shop_review.user = current_user
    if @shop_review.save
      redirect_to shop_path(@shop)
    else
      render 'shops/show'
    end
  end

  private

  def set_shop_review
    @shop_review = ShopReview.find(params[:id])
  end

  def shop_review_params
    params.require(:shop_review).permit(:content, :rating)
  end
end
