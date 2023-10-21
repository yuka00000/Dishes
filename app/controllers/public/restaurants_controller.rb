class Public::RestaurantsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
