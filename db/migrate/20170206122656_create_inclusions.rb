class CreateInclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :inclusions do |t|
      t.string :name
      t.text :overview
      t.attachment :image

      t.timestamps
    end
  end
end
