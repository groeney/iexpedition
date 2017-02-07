class Destination < ApplicationRecord
  has_many :regions
  has_many :histories
  has_many :facts

  has_many :highlight_groupings, as: :highlightable
  has_many :gallery_image_groupings, as: :gallery_imageable

  has_many :highlights, through: :highlight_groupings
  has_many :region_highlights, through: :regions, source: :highlight
  has_many :gallery_images, through: :gallery_image_groupings
  has_many :wildlives, through: :regions
end
