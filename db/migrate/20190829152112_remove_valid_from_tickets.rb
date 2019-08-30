class RemoveValidFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :valid_from, :date
  end
end
