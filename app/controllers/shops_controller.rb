class ShopsController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @marker = {
        lat: @shop.latitude,
        lng: @shop.longitude
      }
  end
end
