class RestaurantInfo::RestaurantsController < ApplicationController
  def show
    @restaurant = current_restaurant
  end
  
  def edit
    @restaurant = current_restaurant
  end
end
