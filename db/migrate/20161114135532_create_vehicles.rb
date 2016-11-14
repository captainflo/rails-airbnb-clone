class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :marque
      t.text :description
      t.references :user
      t.references :category
      t.integer :rating

      t.timestamps
    end
  end
end
