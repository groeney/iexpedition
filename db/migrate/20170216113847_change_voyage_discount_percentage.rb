class ChangeVoyageDiscountPercentage < ActiveRecord::Migration[5.0]
  def change
    rename_column :voyages, :discount_percentage, :discount_amount
  end
end
