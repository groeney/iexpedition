class AddFieldsToVoyage < ActiveRecord::Migration[5.0]
  def change
    add_column :voyages, :overview_tile, :text
    add_column :voyages, :passenger_capacity, :integer
    add_column :voyages, :physical_rating, :string
    add_column :voyages, :includes_flight, :boolean
  end
end
