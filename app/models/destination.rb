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

  has_attached_file :watermark_image, default_url: "/assets/arctic-watermark.png"
  validates_attachment :watermark_image, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :header_image, default_url: "/assets/missing-destination-header-image.png"
  validates_attachment :header_image, content_type: { content_type: /\Aimage\/.*\z/ }

  has_attached_file :map, default_url: "/assets/missing-map.png"
  validates_attachment :map, content_type: { content_type: /\Aimage\/.*\z/ }

  def region_highlights
    self.regions.highlights
  end

  def identifier_s
    self.name
  end

  def activities
    ids = Voyage.where(destination_id: self.id).map { |v| v.activities.pluck(:id) }
                                         .flatten.uniq
    Activity.where(id: ids)
  end
end