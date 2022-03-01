class RenameNumberOfPeopleColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :number_of_people, :num_people
  end
end
