class ItineraryDayGrouping < ApplicationRecord
  belongs_to :itinerary_day
  belongs_to :voyage

  validates_uniqueness_of :day_number, scope: :voyage_id, message: "day number already exists for this voyage"
  validates_presence_of [:itinerary_day, :voyage, :day_number]
end
