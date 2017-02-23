class RemoveRegionReferenceOnVoyage < ActiveRecord::Migration[5.0]
  def change
    remove_reference :voyages, :region, index: true
  end
end
