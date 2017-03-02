class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :discount_amount
      t.integer :discount_type, default: 0

      t.timestamps
    end
  end
end
