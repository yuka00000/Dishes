class Public::ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.restaurant_id = params[:restaurant_id]
    if @reservation.save
      redirect_to reservation_completed_path
    else
      render :new
    end
  end

  def index
    @reservations = current_user.reservations.all
    @restaurant= Restaurant.where(reservation_id: params[:id])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :people_count, :user_id, :restaurant_id, :opening_time, :closing_time)
  end
end