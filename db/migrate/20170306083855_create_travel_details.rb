class CreateTravelDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_details do |t|
      t.string :hotel_name
      t.text :hotel_address
      t.string :flight_number
      t.string :departure_airport
      t.datetime :departure_date
      t.string :arrival_airport
      t.datetime :arrival_date
      t.string :reservation_code

      t.timestamps
    end
  end
end
