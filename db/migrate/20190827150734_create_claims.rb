class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.date :arrival_time
      t.date :departure_time
      t.string :train_id
      t.string :location_from
      t.string :location_to
      t.string :delay_duration
      t.string :reason_for_delay
      t.references :ticket, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
