class RemoveIconFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :icon, :binary
  end
end
