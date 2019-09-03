class AddStatusToClaims < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :status, :string
  end
end
