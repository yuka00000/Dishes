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
  end

  def edit
    @user = current_user
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_image, :user_id, :restaurant_id)
  end
end
