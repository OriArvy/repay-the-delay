class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :ticket_number
      t.float :price
      t.date :valid_from
      t.date :expiry_date
      t.string :ticket_type
      t.string :ticket_photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
