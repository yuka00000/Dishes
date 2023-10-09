class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @user_posts= Post.where(user_id: params[:id])
  end
  
  def edit
    @user = User.new
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :user_id)
  end
  
end
