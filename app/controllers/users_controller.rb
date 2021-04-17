class UsersController < ApplicationController
  def index
    users = User.where.not(id: current_v1_user.id)
    render json: users
  end
end
