class AddGstToVoyage < ActiveRecord::Migration[5.0]
  def change
    add_column :voyages, :gst, :float
  end
end
