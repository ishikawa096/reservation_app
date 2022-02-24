class RemoveRoomNameFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :room_name, :string
  end
end
