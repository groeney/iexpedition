class GalleryImage < ApplicationRecord
  has_attached_file :image, default_url: "/assets/missing.png", styles: { original: "800x600", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }, presence: true

  has_many :gallery_image_groupings, dependent: :destroy

  has_many :ships, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Ship"
  has_many :voyages, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Voyage"
  has_many :destinations, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Destination"
  has_many :cabins, through: :gallery_image_groupings, source: :gallery_imageable, source_type: "Cabin"

  def self.gallery_imageables
    Ship.all + Voyage.all + Destination.all + Cabin.all
  end
end
