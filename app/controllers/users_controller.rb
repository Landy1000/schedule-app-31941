class UsersController < ApplicationController
  def index
    users = User.all.order(:id)
    render json: users
  end
end
