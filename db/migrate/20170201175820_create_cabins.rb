class CreateCabins < ActiveRecord::Migration[5.0]
  def change
    create_table :cabins do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.float :single_supplement, null: false, default: 1
      t.text :description
      t.attachment :image

      t.timestamps
    end
  end
end
