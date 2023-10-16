class Admin::AdminsController < ApplicationController
  def top
  end

  def index
    @users = User.all
    @restaurants = Restaurant.all
  end

  def edit
  end

  def update
  end

  def destroy
    if params[:type] == "restaurant"
      Restaurant.find(params[:id]).destroy
      flash[:success] = "ユーザーを削除しました。"
      redirect_to admins_path
    else
      User.find(params[:id]).destroy
      flash[:success] = "ユーザーを削除しました。"
      redirect_to admins_path
    end
  end
end
