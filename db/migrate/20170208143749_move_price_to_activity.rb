class MovePriceToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :price, :float
    remove_column :activity_groupings, :price
  end
end
