class RestaurantInfo::RestaurantsController < ApplicationController
  before_action :authenticate_restaurant!
  def show
    @restaurant = current_restaurant
  end

  def edit
    @genres = Restaurant.genres.keys.map{|k| I18n.t("enums.restaurant.genre.#{k}")}
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
      flash[:notice] = "更新に成功しました。"
      redirect_to restaurant_info_restaurants_mypage_path
    else
      flash[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :explanation, :post_code, :address, :price_lower_limit, :price_upper_limit, :hp_url, :reservation_method, :email, :phone_number, :restaurant_imag, :opening_time, :closing_time, :genre)
  end

end
