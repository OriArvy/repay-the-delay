class AddDepartureDateToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :departure_date, :string
    add_column :claims, :departure_time, :string
  end
end
