class AddHomeStationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :home_station, :string
  end
end
