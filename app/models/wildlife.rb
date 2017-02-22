class Wildlife < ApplicationRecord
  has_many :wildlife_groupings, dependent: :destroy
  has_many :destinations, through: :wildlife_groupings

  has_attached_file :image, default_url: "/assets/missing.png"

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_uniqueness_of :name
  validates_presence_of [:name, :overview]
end
