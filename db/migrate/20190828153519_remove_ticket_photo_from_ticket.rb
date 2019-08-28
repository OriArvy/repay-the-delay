class RemoveTicketPhotoFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :ticket_photo, :string
  end
end
