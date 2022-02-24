class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

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
    @user = @room.user
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @area = params["area"]
    @keyword = params["keyword"]
    @rooms = Room.search(@area, @keyword)
    render "index"
  end

  def my_rooms
    @rooms = current_user.rooms
  end

    private

  def room_params
    params.require(:room).permit(:name, :introduction, :rate, :address, :user_id, :image)
  end
end
