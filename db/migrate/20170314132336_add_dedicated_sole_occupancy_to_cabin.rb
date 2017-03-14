class AddDedicatedSoleOccupancyToCabin < ActiveRecord::Migration[5.0]
  def change
    add_column :cabins, :dedicated_sole_occupancy, :boolean, default: false, null: false
  end
end
