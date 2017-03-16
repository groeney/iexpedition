class AddSoloTravellerToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :solo_traveller, :boolean, default: false, null: false
  end
end
