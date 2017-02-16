class Cabin < ApplicationRecord
  has_many :cabin_groupings, dependent: :destroy
  has_many :feature_groupings, as: :featurable, dependent: :destroy

  has_many :voyages, through: :cabin_groupings
  has_many :features, through: :feature_groupings

  validates_presence_of [:name, :price]
  validates_uniqueness_of :name, scope: :price, message: "name and price should be unique"

  has_attached_file :image, default_url: "/assets/missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  scope :voyage, -> (voyage_id) { joins(:cabin_groupings).where(cabin_groupings: { voyage_id: voyage_id }) }

  def identifier_s
    "#{self.name} for $#{self.price}"
  end
end
