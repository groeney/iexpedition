class Region < ApplicationRecord
  belongs_to :destination

  has_many :highlight_groupings, as: :highlightable, dependent: :destroy

  has_many :highlights, through: :highlight_groupings
  has_many :histories, through: :destination
  has_many :facts, through: :destination

  validates_uniqueness_of :name

  has_attached_file :image, default_url: "/assets/missing-destination-header-image.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  def identifier_s
    self.name
  end
end
