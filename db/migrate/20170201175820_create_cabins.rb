class CreateCabins < ActiveRecord::Migration[5.0]
  def change
    create_table :cabins do |t|
      t.references :voyage, foreign_key: true
      t.string :class, null: false
      t.float :price, null: false
      t.float :single_supplement, null: false, default: 1
      t.timestamps
    end
  end
end
