class Admin::AdminsController < ApplicationController
  def top
  end

  def index
 
    @posts = Post.all
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
      Post.find(params[:id]).destroy
      flash[:success] = "ユーザーを削除しました。"
      redirect_to admins_path
    end
  end
end
