class RoomsController < ApplicationController
  def index
    rooms = Room.all
    myRooms = current_v1_user.rooms
    render json: myRooms
  end

  def create
    room = Room.new(room_params)
    if room.save
      render json: room
    else
      render json: room.errors
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
