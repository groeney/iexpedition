class CreateFeatureGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :feature_groupings do |t|
      t.integer :featurable_id
      t.string :featurable_type
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
