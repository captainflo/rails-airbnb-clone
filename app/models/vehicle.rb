class Vehicle < ApplicationRecord
  has_many: :reservations
  belongs_to: :user
  belongs_to: :category
end
