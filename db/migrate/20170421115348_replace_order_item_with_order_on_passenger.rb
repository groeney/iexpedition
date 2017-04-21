class ReplaceOrderItemWithOrderOnPassenger < ActiveRecord::Migration[5.0]
  def change
    remove_reference :passengers, :order_item, foreign_key: true
    add_reference :passengers, :order, foreign_key: true
  end
end
