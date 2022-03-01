class RemoveImageFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :image, :binary
  end
end
