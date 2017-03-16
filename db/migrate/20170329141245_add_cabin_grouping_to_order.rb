class AddCabinGroupingToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :cabin_grouping, foreign_key: true
  end
end
