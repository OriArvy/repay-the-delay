class RemoveDepartureTimeFromClaims < ActiveRecord::Migration[5.2]
  def change
    remove_column :claims, :departure_time, :date
  end
end
