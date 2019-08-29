class RemoveCountryFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :country, :string
  end
end
