class AddCityToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :city, :string
  end
end
