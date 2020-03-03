class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def index
    @bars = Bars.all
  end

  def show
    @bar = Bars.find(params[:id])
  end

end
