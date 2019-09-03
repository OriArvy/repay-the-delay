class AddWorkStationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :work_station, :string
  end
end
