class BarsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
  end
end
