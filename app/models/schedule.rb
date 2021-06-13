class Schedule < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :date, presence: true
  validates :time, uniqueness: { scope: [:date, :user_id, :room_id] }
end
