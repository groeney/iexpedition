class CreateRegionGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :region_groupings do |t|
      t.references :voyage
      t.references :region
      t.timestamps
    end
  end
end
