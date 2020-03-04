class ShopsController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @opening_times = arrange(@shop.opening_times)
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
