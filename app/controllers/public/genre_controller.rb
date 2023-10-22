class Public::GenreController < ApplicationController
  def index
    @genres = Genre.all
  end
  
  def show
    @genre = Genre.find(params[:id])
    @restaurants = Restaurant.joins(:genres).where('genres.id = ? ', params[:id])
  end
end
