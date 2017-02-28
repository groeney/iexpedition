class Ship < ApplicationRecord
  belongs_to :operator
  has_many :voyages, dependent: :destroy

  has_many :feature_groupings, as: :featurable, dependent: :destroy
  has_many :gallery_image_groupings, as: :gallery_imageable, dependent: :destroy

  has_many :features, through: :feature_groupings
  has_many :gallery_images, through: :gallery_image_groupings
  has_many :destinations, through: :voyages

  validates_uniqueness_of :name, scope: :operator_id

  has_attached_file :header_image, default_url: "/assets/missing-ship-header-image.png", styles: { thumb: "150x150" }
  validates_attachment :header_image, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :map, default_url: "/assets/missing-map.png", styles: { thumb: "150x150" }
  validates_attachment :map, content_type: { content_type: /\Aimage\/.*\z/ }

  scope :destination, -> (destination_name) { joins(:destinations).where(destinations: { name: destination_name }) }

  def identifier_s
    self.name
  end

  def cabins
    ids = Voyage.where(ship_id: self.id).map { |voyage| voyage.cabins.pluck(:id)  }.flatten.uniq
    Cabin.where(id: ids)
  end
end
