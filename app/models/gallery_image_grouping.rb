class GalleryImageGrouping < ApplicationRecord
  belongs_to :gallery_image
  belongs_to :gallery_imageable, polymorphic: true
end
