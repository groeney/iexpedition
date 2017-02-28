class AddVoyageInfoToDestination < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :voyage_info, :text
  end
end
