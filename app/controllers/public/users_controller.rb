class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
