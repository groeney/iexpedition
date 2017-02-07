class CreateItineraryDayGroupings < ActiveRecord::Migration[5.0]
  def change
    create_table :itinerary_day_groupings do |t|
      t.references :voyage
      t.references :itinerary_day
      t.integer :day_number, null: false

      t.timestamps
    end
  end
end
