class ItineraryDayGrouping < ApplicationRecord
  belongs_to :itinerary_day
  belongs_to :voyage

  # Validates uniqueness of day_number and voyage_id
end
