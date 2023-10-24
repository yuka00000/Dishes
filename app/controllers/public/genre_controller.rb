class Public::GenreController < ApplicationController
  before_action :authenticate_user!
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @restaurants = Restaurant.joins(:genres).where('genres.id = ? ', params[:id])
  end
end
