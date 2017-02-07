class GalleryImage < ApplicationRecord
  has_many :gallery_image_groupings

  has_many :ships, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Ship"
  has_many :voyages, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Voyage"
  has_many :destinations, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Destination"
end
