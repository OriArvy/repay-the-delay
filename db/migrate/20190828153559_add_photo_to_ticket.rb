class AddPhotoToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :photo, :string
  end
end
