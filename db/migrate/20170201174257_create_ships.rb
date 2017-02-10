class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.string :name, null: false
      t.string :operator_name
      t.string :category
      t.string :currency, null: false
      t.integer :payment_prior
      t.text :recommendation_text
      t.integer :passenger_capacity
      t.integer :luxury_star_rating
      t.integer :crew_number
      t.string :ice_class
      t.integer :speed
      t.date :year_refurbished
      t.date :year_built
      t.integer :length
      t.integer :width
      t.integer :tonnage
      t.integer :registry
      t.integer :engines
      t.integer :outlets, default: 0
      t.boolean :open_bridge, default: false
      t.integer :observation_decks
      t.integer :zodiacs
      t.string :provided_gear
      t.boolean :polar_code_compliant, default: true

      t.timestamps
    end
  end
end
