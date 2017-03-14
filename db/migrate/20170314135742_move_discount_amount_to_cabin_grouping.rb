class MoveDiscountAmountToCabinGrouping < ActiveRecord::Migration[5.0]
  def change
    remove_column :cabins, :discount_amount
    add_column :cabin_groupings, :discount_amount, :integer, default: 0, null: false
  end
end
