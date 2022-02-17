class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_address
      t.integer :room_rate
      t.binary :room_image
      t.text :room_introduction

      t.timestamps
    end
  end
end
