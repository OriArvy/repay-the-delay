class CreateCancels < ActiveRecord::Migration[5.2]
  def change
    create_table :cancels do |t|
      t.string :code
      t.string :reason

      t.timestamps
    end
  end
end
