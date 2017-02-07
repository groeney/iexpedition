class CreateHighlights < ActiveRecord::Migration[5.0]
  def change
    create_table :highlights do |t|
      t.text :name
      t.text :overview
      t.attachment :image
      t.text :label

      t.timestamps
    end
  end
end
