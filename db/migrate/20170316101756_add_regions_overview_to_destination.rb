class AddRegionsOverviewToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :regions_overview, :text
  end
end
