class ShopsController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @opening_times = arrange(@shop.opening_times)
    @shop_reviews = @shop.shop_reviews
    user_signed_in? ? @user = current_user : @user = User.where(first_name: "anonymous").first
    if (Visit.where(user: @user, shop: @shop) == [])
      @visit = Visit.new(shop: @shop, user: @user)
      @visit.save!
    else
      @visit = Visit.where(user: @user, shop: @shop).last
      @visit.count += 1
      @visit.save!
    end
    @rating = 0
    if @shop_reviews.length != 0
      @shop_reviews.each do |shop_review|
        @rating += shop_review.rating
      end
      @rating /= @shop_reviews.length
    end
  end

  def search
    if params[:search].blank?
      redirect_to(shops_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Shop.all.where("lower(name) ILIKE :search OR description ILIKE :search", search: "%#{@parameter}%")
    end
  end

  private

  def arrange(opening_times)
    time_hash = {}
    opening_times.each do |opening_time|
      day = opening_time.actual_day
      if time_hash[day] == nil
        time_hash[day] = {}
        time_hash[day]["open"] = opening_time.open
        if opening_time.open
          time_hash[day]["openings"] = []
          time_hash[day]["openings"] << [opening_time.opening_hour, opening_time.closing_hour]
        end
      elsif opening_time.opening_hour < time_hash[day]["openings"][0][0]
        time_hash[day]["openings"].prepend [opening_time.opening_hour, opening_time.closing_hour]
      else
        time_hash[day]["openings"] << [opening_time.opening_hour, opening_time.closing_hour]
      end
    end
    return time_hash
  end
end
