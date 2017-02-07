class CreateWildlives < ActiveRecord::Migration[5.0]
  def change
    create_table :wildlives do |t|
      t.text :name
      t.text :overview
      t.attachment :image
      t.text :label
      t.text :fact

      t.timestamps
    end
  end
end
