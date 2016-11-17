class AddPhotoToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :photo, :string
  end
end
