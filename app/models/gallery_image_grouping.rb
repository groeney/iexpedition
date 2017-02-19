class GalleryImageGrouping < ApplicationRecord
  belongs_to :gallery_image
  belongs_to :gallery_imageable, polymorphic: true

  validates_presence_of [:gallery_image, :gallery_imageable, :gallery_imageable_type]

  validates_uniqueness_of :gallery_image_id, scope: [:gallery_imageable_type, :gallery_imageable_id], message: "gallery image already exists for this resource"
end
