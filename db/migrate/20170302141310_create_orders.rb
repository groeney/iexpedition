class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :voyage
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
