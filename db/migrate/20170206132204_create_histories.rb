class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string :name
      t.text :overview
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
