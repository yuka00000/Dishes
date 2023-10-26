class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @open_and_close_time = make_time(@restaurant.opening_time, @restaurant.closing_time)

    @date = params[:date]
    @time = params[:time]
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.restaurant_id = params[:restaurant_id]
    if @reservation.save
      redirect_to reservation_completed_path
    else
      @open_and_close_time = make_time(@restaurant.opening_time, @restaurant.closing_time)
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

  def make_time(opening, closing)
    increment = 1800
    from_time = opening.to_i
    to_time = closing.to_i
    from_time.step(to_time, increment).map { |m| [Time.at(m).strftime('%H:%M'), Time.at(m).strftime('%H:%M')] }
  end
end