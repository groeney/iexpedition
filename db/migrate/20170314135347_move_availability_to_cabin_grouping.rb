class MoveAvailabilityToCabinGrouping < ActiveRecord::Migration[5.0]
  def change
    remove_column :cabins, :availability
    add_column :cabin_groupings, :availability, :integer, default: 5, null: false
  end
end
