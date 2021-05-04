class Schedule < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :time, uniqueness: { scope: [:date, :user_id, :room_id] }
end
