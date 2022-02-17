class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false, unique: true
      t.string :password, :null => false
      t.binary :icon
      t.string :introduction

      t.timestamps
    end
  end
end
