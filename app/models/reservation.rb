class Reservation < ApplicationRecord
  belongs_to: :vehicles
  belongs_to: :user
  validates :user, presence: true
  validates :vehicle, presence: true
  validates :available, presence: true
  validates :start_date, presence: true
  validates :end_start, presence: true
end
