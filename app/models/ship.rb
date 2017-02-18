class Ship < ApplicationRecord
  belongs_to :operator
  has_many :voyages, dependent: :destroy

  has_many :feature_groupings, as: :featurable, dependent: :destroy
  has_many :gallery_image_groupings, as: :gallery_imageable, dependent: :destroy

  has_many :features, through: :feature_groupings
  has_many :gallery_images, through: :gallery_image_groupings
  has_many :destinations, through: :voyages

  validates_uniqueness_of :name

  def identifier_s
    self.name
  end
end
