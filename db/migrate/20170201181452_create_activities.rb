class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :voyage, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
