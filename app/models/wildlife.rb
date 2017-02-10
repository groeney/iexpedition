class Wildlife < ApplicationRecord
  has_many :wildlife_groupings, dependent: :destroy

  has_many :voyages, through: :wildlife_groupings, source: :wildlifable, source_type: "Voyage"
  has_many :regions, through: :wildlife_groupings, source: :wildlifable, source_type: "Region"

  has_attached_file :image, default_url: "/assets/missing.png"

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_uniqueness_of :name
  validates_presence_of [:name, :overview]

  def self.wildlifables
    Region.all + Voyage.all
  end
end
