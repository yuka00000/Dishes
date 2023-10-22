class Public::RanksController < ApplicationController
  before_action :authenticate_user!
  def rank
    # 投稿のいいね数ランキング
    @post_favorite_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    @posts = Post.all
  end
end
