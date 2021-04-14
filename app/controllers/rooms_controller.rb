class RoomsController < ApplicationController
  def index
    rooms = Room.all
    myRooms = current_v1_user.rooms
    render json: myRooms
  end
end
