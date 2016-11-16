class Vehicle < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
  has_many :reservations
  belongs_to :user
  belongs_to :category
  validates :user, presence: true
  validates :description, presence: true
  validates :marque, presence: true
  validates :category, presence: true
  validates :city, presence: true

end
