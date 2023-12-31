class Public::UsersController < ApplicationController
before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @posts= Post.where(user_id: params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
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

    if @user.email == 'guest@example.com'
      flash[:notice] = "ゲストユーザーは編集できません。"
      redirect_to posts_path
    elsif @user.email != 'guest@example.com'
      @user.update(user_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to user_path
    else
      flash[:notice] = "更新に失敗しました。"
      render :edit
    end
  end

  # フォロー一覧
  def follows
  @user = User.find(params[:id])
  @users = @user.following_users
  end

  # フォロワー一覧
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:user_image, :user_name, :introduction, :email, :phone_number)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
 
end