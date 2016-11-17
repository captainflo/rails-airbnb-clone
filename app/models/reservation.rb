class Reservation < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  validates :user, presence: true
  validates :vehicle, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
end
