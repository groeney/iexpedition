class Voyage < ApplicationRecord
  belongs_to :ship
  belongs_to :destination

  has_many :region_groupings, dependent: :destroy
  has_many :cabin_groupings, dependent: :destroy
  has_many :itinerary_day_groupings, dependent: :destroy
  has_many :activity_groupings, dependent: :destroy
  has_many :inclusion_groupings, dependent: :destroy
  has_many :exclusion_groupings, dependent: :destroy

  has_many :highlight_groupings, as: :highlightable, dependent: :destroy
  has_many :gallery_image_groupings, as: :gallery_imageable, dependent: :destroy

  has_many :cabins, through: :cabin_groupings
  has_many :itinerary_days, through: :itinerary_day_groupings
  has_many :activities, through: :activity_groupings
  has_many :inclusions, through: :inclusion_groupings
  has_many :exclusions, through: :exclusion_groupings
  has_many :highlights, through: :highlight_groupings
  has_many :gallery_images, through: :gallery_image_groupings
  has_many :regions, through: :region_groupings

  has_attached_file :map, default_url: "/assets/missing-map.png"
  validates_attachment :map, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :image, default_url: "/assets/missing-voyage.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :header_image, default_url: "/assets/missing-voyage-header-image.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  scope :destination, -> (destination_name) { joins(:destination).where(destinations: { name: destination_name }) }
  scope :region, -> (region_name) { joins(:region_groupings).where(region_groupings: { region_id: Region.find_by_name(region_name) }) }
  scope :ship, -> (ship_id) { joins(:ship).where(ships: { id: ship_id }) }

  def identifier_s
    self.nil? ? "unidentifiable" : "#{self.name} on #{self.ship.name} from #{self.start_date} to #{self.end_date}"
  end

  def destination_highlights
    self.destination.highlights
  end

  def from_price
    self.cabins.minimum(:price)
  end

  def formatted_start_date
    self.start_date.strftime('%d %b %Y')
  end

  def formatted_end_date
    self.end_date.strftime('%d %b %Y')
  end

  def alternative_dates
    Voyage.where(name: self.name).map { |v| [v.start_date, v.end_date] }
  end
end
