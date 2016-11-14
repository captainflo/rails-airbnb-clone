class Reservation < ApplicationRecord
  belongs_to: :vehicles
  belongs_to: :user
  validates :user, :vehicle, :available, :start_date, :end_start
end
