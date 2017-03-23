class AddFieldsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :deposit_invoice_link, :string
    add_attachment :orders, :deposit_invoice
    add_column :orders, :payment_invoice_link, :string
    add_attachment :orders, :payment_invoice
    add_column :orders, :payment_summary, :text
  end
end