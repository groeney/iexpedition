class ItineraryDay < ApplicationRecord
  has_many :itinerary_day_groupings, dependent: :destroy
  has_many :voyages, through: :itinerary_day_groupings

  has_attached_file :image, default_url: "/assets/missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_presence_of [:name, :overview]
end
