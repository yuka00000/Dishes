class RestaurantInfo::RestaurantsController < ApplicationController
  def show
    @restaurant = current_restaurant
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant == current_restaurant
      redirect_to restaurant_info_top_path
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant == current_restaurant
      redirect_to restaurant_info_top_path
    end
    @restaurants = Restaurant.all
    if @restaurant.update(restaurant_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to restaurant_info_restaurants_mypage_path
    else
      flash[:notice] = "You failed to update user."
      render :edit
    end
  end
  
  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :explanation, :post_code, :address, :price_lower_limit, :price_upper_limit, :hp_url, :reservation_method, :email, :phone_number, :restaurant_image)
  end

end
