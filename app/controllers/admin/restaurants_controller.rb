class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @restaurants = Restaurant.page(params[:page])
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "ユーザーを強制退会させました"
    redirect_to admin_restaurants_path
  end
end
