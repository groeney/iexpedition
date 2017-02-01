class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :name, null: false
      t.string :operator_name
      t.string :category
      t.string :currency, null: false
      t.integer :payment_prior

      t.timestamps
    end
  end
end
