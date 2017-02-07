class Voyage < ApplicationRecord
  belongs_to :ship
  belongs_to :destination
  belongs_to :region

  has_many :cabin_groupings
  has_many :itinerary_day_groupings
  has_many :activity_groupings
  has_many :inclusion_groupings
  has_many :exclusion_groupings

  has_many :highlight_groupings, as: :highlightable
  has_many :gallery_image_groupings, as: :gallery_imageable
  has_many :wildlife_groupings, as: :wildlifable

  has_many :cabins, through: :cabin_groupings
  has_many :itinerary_days, through: :itinerary_day_groupings
  has_many :activities, through: :activity_groupings
  has_many :inclusions, through: :inclusion_groupings
  has_many :exclusions, through: :exclusion_groupings
  has_many :wildlives, through: :wildlife_groupings
  has_many :highlights, through: :highlight_groupings
  has_many :gallery_images, through: :gallery_image_groupings
  has_many :histories, through: :region
  has_many :facts, through: :region
  has_many :region_highlights, through: :region, source: :highlight
end
