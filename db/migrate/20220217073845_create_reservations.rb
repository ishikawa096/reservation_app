class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_at
      t.date :end_at
      t.integer :number_of_people
      t.integer :user_id

      t.timestamps
    end
  end
end
