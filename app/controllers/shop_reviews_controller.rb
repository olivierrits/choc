class ShopReviewsController < ApplicationController
  before_action :set_shop_review, only: :show
  before_action :set_shop
  before_action :authenticate_user!

  def new
    @shop_review = ShopReview.new
  end

  def create
    @shop_review = ShopReview.new(shop_review_params)
    visit = Visit.where(user: current_user, shop: @shop)
    @shop_review.visit = @visit
    @shop_review.user_id = current_user.id
    @shop_review.shop_id = @shop.id
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

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def shop_review_params
    params.require(:shop_review).permit(:content, :rating)
  end
end
