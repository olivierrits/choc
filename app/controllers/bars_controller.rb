class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def index
  end

  def show
  end
end
