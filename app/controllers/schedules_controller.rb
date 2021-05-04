class SchedulesController < ApplicationController
  def index
    room = Room.find(params[:room_id])
    roommates = room.users
    schedules = room.schedules
    json = {schedules: schedules, roommates: roommates}
    render json: json
  end

  def create
    schedule = Schedule.new(schedule_params)
    schedule.save
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date, :time).merge(user_id: current_v1_user.id, room_id: params[:room_id])
  end
end
