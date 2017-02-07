class ItineraryDay < ApplicationRecord
  has_many :itinerary_day_groupings
  has_many :voyages, through: :itinerary_day_groupings
end
