class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
    @rooms = Room.where(params[Reservation.ids])
  end

  def new
    @room = Room.find(params[:room_id])
    @user = @room.user
    if params[:start_at].blank? || params[:end_at].blank?
      flash.now[:alert] = "開始日と終了日を選択してください"
      render "rooms/show"
    elsif params[:start_at].to_date < Date.today
      flash.now[:alert] = "開始日は今日以降の日付を選択してください"
      render "rooms/show"
    elsif params[:end_at] < params[:start_at]
      flash.now[:alert] = "終了日は開始日より後の日付を選択してください"
      render "rooms/show"
    elsif params[:num_people].blank? || params[:num_people].to_i <= 0
      flash.now[:alert] = "人数は1人以上入力してください"
      render "rooms/show"
    else
      @reservation = Reservation.new
      @days = ( params[:end_at].to_date - params[:start_at].to_date ).to_i
      @days = 1 if @days == 0
      @charge = @room.rate.to_i * params[:num_people].to_i * @days
    end
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "新規予約が完了しました"
      redirect_to :reservations
    else
      @reservation = Reservation.new(reservation_params)
      render "top/index"
      flash.now[:alert] = "予約できませんでした"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end

  def edit
  end

  def update
  end

  def destroy
  end

     private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :charge, :num_people, :room_id, :user_id, :room_image)
  end

end
