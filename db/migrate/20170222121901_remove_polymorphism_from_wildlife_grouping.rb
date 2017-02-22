class RemovePolymorphismFromWildlifeGrouping < ActiveRecord::Migration[5.0]
  def change
    remove_column :wildlife_groupings, :wildlifable_type, :string
    remove_column :wildlife_groupings, :wildlifable_id, :integer
    add_reference :wildlife_groupings, :destination, foreign_key: true
  end
end
