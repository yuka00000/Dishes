class Public::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
