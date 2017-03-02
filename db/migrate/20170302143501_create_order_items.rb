class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.string :productable_type
      t.string :productable_id
      t.integer :qty, default: 1

      t.timestamps
    end
  end
end
