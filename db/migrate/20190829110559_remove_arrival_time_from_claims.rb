class RemoveArrivalTimeFromClaims < ActiveRecord::Migration[5.2]
  def change
    remove_column :claims, :arrival_time, :date
  end
end
