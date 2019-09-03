class AddSavingsToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :savings, :float
  end
end
