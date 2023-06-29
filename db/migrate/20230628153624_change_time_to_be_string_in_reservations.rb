class ChangeTimeToBeStringInReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :time, :string
  end
end
