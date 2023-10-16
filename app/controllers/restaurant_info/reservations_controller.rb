class RestaurantInfo::ReservationsController < ApplicationController
  def index
    @reservations = current_restaurant.reservations.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def reservation_params
    params.require(:reservation).permit(:date, :time, :people_count, :first_name, :last_name, :user_id, :restaurant_id)
  end
end
