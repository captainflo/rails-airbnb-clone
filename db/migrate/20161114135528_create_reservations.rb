class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.reference :user
      t.reference :vehicle
      t.boolean :available
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
