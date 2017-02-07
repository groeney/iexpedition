class CreateWildlifeGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :wildlife_groupings do |t|
      t.integer :wildlifable_id
      t.string :wildlifable_type
      t.references :wildlife, foreign_key: true

      t.timestamps
    end
  end
end
