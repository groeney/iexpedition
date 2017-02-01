class CreateVoyages < ActiveRecord::Migration[5.0]
  def change
    create_table :voyages do |t|
      t.references :ship, foreign_key: true
      t.string :name, null: false
      t.string :overview
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :embark_port
      t.string :disembark_port
      t.integer :discount_percentage, default: 0
      t.timestamps
    end
  end
end
