class CreateHighlightGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :highlight_groupings do |t|
      t.integer :highlightable_id
      t.string :highlightable_type
      t.references :highlight, foreign_key: true

      t.timestamps
    end
  end
end
