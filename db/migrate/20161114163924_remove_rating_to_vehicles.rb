class RemoveRatingToVehicles < ActiveRecord::Migration[5.0]
  def change
    remove_column :vehicles, :rating, :integer
  end
end
