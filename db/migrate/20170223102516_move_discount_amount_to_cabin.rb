class MoveDiscountAmountToCabin < ActiveRecord::Migration[5.0]
  def change
    remove_column :voyages, :discount_amount, :integer, default: 0
    add_column :cabins, :discount_amount, :integer, default: 0
  end
end
