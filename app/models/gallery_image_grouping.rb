class GalleryImageGrouping < ApplicationRecord
  belongs_to :gallery_image
  belongs_to :gallery_imageable, polymorphic: true

  validates_uniqueness_of :gallery_image_id, scope: [:gallery_imagable_type, :gallery_imagable_id], message: "gallery image already exists for this resource"
end
