class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @room = Room.where(id: @reservations.ids)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
      if @reservation.save
        flash[:notice] = "新規予約が完了しました"
        redirect_to :root
      else
        render "new"
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
