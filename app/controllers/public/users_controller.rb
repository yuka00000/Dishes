class Public::UsersController < ApplicationController

  def show
    @user =　User.new(params[:id])
    @posts = @user.posts
  end
end
