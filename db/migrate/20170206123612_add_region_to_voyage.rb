class AddRegionToVoyage < ActiveRecord::Migration[5.0]
  def change
    add_reference :voyages, :region, foreign_key: true
  end
end
