class AddRatingToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :rating, :integer 
  end
end
