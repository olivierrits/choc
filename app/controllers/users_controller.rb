class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @bar_reviews = @user.bar_reviews
    @shop_reviews = @user.shop_reviews
    @visits = @user.visits.where(favourite: true)
    @tastes = @user.tastes.where(favourite: true)
  end
end
