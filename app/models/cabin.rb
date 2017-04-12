class Cabin < ApplicationRecord
  has_many :order_items, as: :productable
  has_many :cabin_groupings, dependent: :destroy
  has_many :feature_groupings, as: :featurable, dependent: :destroy
  has_many :gallery_image_groupings, as: :gallery_imageable, dependent: :destroy

  has_many :voyages, through: :cabin_groupings
  has_many :features, through: :feature_groupings
  has_many :gallery_images, through: :gallery_image_groupings

  validates_presence_of [:name, :price]
  # validates_uniqueness_of :name, scope: [:price, :description], message: ", price and description should be unique combinations"

  has_attached_file :image, default_url: "/assets/missing-cabin.png", styles: { original: "512x512>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  scope :voyage, -> (voyage_id) { joins(:cabin_groupings).where(cabin_groupings: { voyage_id: voyage_id }) }

  def identifier_s
    "#{self.name} for $#{self.price}"
  end

  def square_feet
    (self.square_meter || 0) * 10.7639 # conversion rate from google
  end

  def additional_single_supp
    self.price * (self.single_supplement - 1)
  end
end
