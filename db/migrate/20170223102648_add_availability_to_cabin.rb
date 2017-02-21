class AddAvailabilityToCabin < ActiveRecord::Migration[5.0]
  def change
    add_column :cabins, :availability, :integer, default: 5
  end
end
