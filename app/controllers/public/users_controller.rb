class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @user_posts= Post.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to posts_path
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to posts_path
    end
    
    if @user.update(user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to user_path
    else
      flash[:notice] = "You failed to update user."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_image, :user_name, :introduction, :email, :phone_number)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts__path
    end
  end

end
