class BarsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    if (Taste.where(user: current_user, bar: @bar) != [])
      @taste = Taste.new(bar: @bar, user: current_user)
      @taste.save!
    end
  end
end
