class Public::ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # 開始時間と終了時間を指定して、一定の時間間隔で時間のリストを生成する関数
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
    is_matching_login_user
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :people_count, :user_id, :restaurant_id, :opening_time, :closing_time)
  end
  # 関数の定義
  def make_time(opening, closing)
    # 時間の増分を設定（1800秒＝30分）
    increment = 1800
    from_time = opening.to_i
    to_time = closing.to_i
    # 開始時間から終了時間まで、一定の増分で時間を生成し、フォーマットしてリストにする
    from_time.step(to_time, increment).map { |m| [Time.zone.at(m).strftime('%H:%M'), Time.zone.at(m).strftime('%H:%M')] }
  end
  
  #ログインユーザーと予約ユーザーが一致しているかどうかを確認し、一致しない場合は投稿一覧ページにリダイレクト
  def is_matching_login_user
    reservation = Reservation.find(params[:id])
    unless reservation.user.id == current_user.id
      redirect_to posts_path
    end
  end
  
end