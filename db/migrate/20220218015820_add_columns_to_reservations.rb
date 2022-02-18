class AddColumnsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_name, :string
    add_column :reservations, :charge, :integer
    add_column :reservations, :room_id, :integer
  end
end
