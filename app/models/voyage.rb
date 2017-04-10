class Voyage < ApplicationRecord
  include Filterable

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

  scope :destinations, -> (destination_ids) { joins(:destination).where(destinations: { id: destination_ids }) }
  scope :regions, -> (region_ids) { joins(:region_groupings).where(region_groupings: { region_id: region_ids }) }
  scope :ships, -> (ship_ids) { joins(:ship).where(ships: { id: ship_ids }) }
  scope :price, -> (price) { joins(:cabins).where("(currency = 'AUD' and cabins.price BETWEEN 0 and #{price.to_i}) or (currency = 'USD' and cabins.price BETWEEN 0 and #{price.to_i*0.75})") }
  scope :departure_date, -> (date) { where('start_date >= ?', date) }
  scope :duration, -> (days) { where('end_date - start_date <= ?', days.to_i) }
  scope :names, -> (names) { where(name: names) }
  scope :passenger_capacity, -> (capacity_range) { where(voyages: { passenger_capacity: capacity_range[0]..capacity_range[1] }) }
  scope :embark_ports, -> (embark_ports) { where(embark_port: embark_ports) }
  scope :highlight_names, -> (names) { joins(:highlights).where(highlights: { name: names }) }
  scope :activity_names, -> (names) { joins(:activities).where(activities: { name: names }) }

  def identifier_s
    (self.nil? || self.ship.nil?) ? "[unidentifiable]" : "#{self.name} on #{self.ship.name} from #{self.start_date} to #{self.end_date}"
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

  def alternative_voyages
    Voyage.where(name: self.name, ship_id: self.ship.id)
  end

  def gst_perc
    (self.gst || 0.0) / 100.0
  end

  def duration
    (self.end_date - self.start_date).to_i
  end

  def elaborate_inclusions
    self.inclusions.where.not(overview: nil)
  end

  def simple_inclusions
    self.inclusions.where(overview: nil)
  end
end
