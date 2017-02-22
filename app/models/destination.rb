class Destination < ApplicationRecord
  has_many :regions
  has_many :histories, dependent: :destroy
  has_many :facts, dependent: :destroy

  has_many :highlight_groupings, as: :highlightable, dependent: :destroy
  has_many :gallery_image_groupings, as: :gallery_imageable, dependent: :destroy
  has_many :wildlife_groupings, dependent: :destroy

  has_many :highlights, through: :highlight_groupings
  has_many :gallery_images, through: :gallery_image_groupings
  has_many :wildlives, through: :wildlife_groupings

  validates_uniqueness_of :name

  def region_highlights
    self.regions.highlights
  end

  def identifier_s
    self.name
  end
end
