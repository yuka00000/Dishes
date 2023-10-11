class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id


    if @post.save
      flash[:notice] = "You have created book successfully."
      redirect_to posts_path
    else
      render :index
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    is_matching_login_user
    #@user = current_user
    @post = Post.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to posts_path
    else
      flash[:notice] = "You failed to update user."
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  
  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :user_id, :restaurant_id)
  end
end
