class CreateExclusionGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :exclusion_groupings do |t|
      t.references :voyage
      t.references :exclusion

      t.timestamps
    end
  end
end
