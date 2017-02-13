class Voyage < ApplicationRecord
  belongs_to :ship
  belongs_to :destination
  belongs_to :region

  has_many :cabin_groupings, dependent: :destroy
  has_many :itinerary_day_groupings, dependent: :destroy
  has_many :activity_groupings, dependent: :destroy
  has_many :inclusion_groupings, dependent: :destroy
  has_many :exclusion_groupings, dependent: :destroy

  has_many :highlight_groupings, as: :highlightable, dependent: :destroy
  has_many :gallery_image_groupings, as: :gallery_imageable, dependent: :destroy
  has_many :wildlife_groupings, as: :wildlifable, dependent: :destroy

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

  has_attached_file :map, default_url: "/assets/missing.png"
  validates_attachment :map, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :image, default_url: "/assets/missing-voyage-temp.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  scope :destination, -> (destination_name) { joins(:destination).where(destinations: { name: destination_name }) }
  scope :region, -> (region_name) { joins(:region).where(regions: { name: region_name }) }

  def identifier_s
    self.nil? ? "[unidentifiable]" : "#{self.name} on #{self.ship.name} from #{self.start_date} to #{self.end_date}"
  end

  def destination_highlights
    self.destination.highlights
  end

  def region_highlights
    self.region.highlights
  end

  def region_wildlives
    self.region.wildlives
  end
end
