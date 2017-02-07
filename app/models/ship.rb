class Ship < ApplicationRecord
  has_many :voyages

  has_many :feature_groupings, as: :featurable
  has_many :gallery_image_groupings, as: :gallery_imageable

  has_many :features, through: :feature_groupings
  has_many :gallery_images, through: :gallery_image_groupings
end
