class CreatePhotoCards < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_cards do |t|
      t.string :photo
      t.string :card_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
