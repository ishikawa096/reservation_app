class RenameColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :room_name, :name
    rename_column :rooms, :room_address, :address
    rename_column :rooms, :room_rate, :rate
    rename_column :rooms, :room_image, :image
    rename_column :rooms, :room_introduction, :introduction
  end
end
