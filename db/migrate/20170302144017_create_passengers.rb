class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.references :order_item, foreign_key: true
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.datetime :dob
      t.string :nationality

      t.timestamps
    end
  end
end
