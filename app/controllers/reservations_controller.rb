class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @room = Room.find(params[:room_id])
    if params[:start_at].blank? || params[:end_at].blank? || params[:num_people].blank?
      flash[:notice] = "予約情報を入力してください"
      redirect_to room_url(@room)
    elsif
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
        redirect_to room_url(@room)
      else
        render :root
        flash[:alert] = "予約できませんでした"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

     private

  def reservation_params
    params.require(:reservation).permit(:room_name, :start_at, :end_at, :charge, :num_people, :room_id, :user_id)
  end
end
