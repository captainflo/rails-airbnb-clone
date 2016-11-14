class Vehicle < ApplicationRecord
  has_many: :reservations
  belongs_to: :user
  belongs_to: :category
  validates :user, presence: true
  validates :description, presence: true
  validates :marque, presence: true
  validates :category, presence: true

end
