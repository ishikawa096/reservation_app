class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

     if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :root
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

    private

  def room_params
    params.require(:room).permit(:name, :introduction, :image, :rate, :address, :user_id)
  end
end
