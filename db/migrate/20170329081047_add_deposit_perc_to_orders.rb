class AddDepositPercToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :deposit_perc, :float, default: 25
  end
end
