class RemoveAvailableToReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :available, :boolean
  end
end
