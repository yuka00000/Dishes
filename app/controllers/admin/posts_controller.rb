class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    if params[:type] == "posts"
      Post.find(params[:id]).destroy
      flash[:success] = "投稿を削除しました。"
      redirect_to admin_posts_path
    else
      User.find(params[:id]).destroy
      flash[:success] = "ユーザーを強制退会させました"
      redirect_to admin_posts_path
    end
  end
end
