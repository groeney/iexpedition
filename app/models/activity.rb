class Activity < ApplicationRecord
  has_many :activity_groupings, dependent: :destroy
  has_many :voyages, through: :activity_groupings

  has_attached_file :image, default_url: "/assets/missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  validates_uniqueness_of :name, scope: [:price, :label], message: "name, price and label should be unique"

  def identifier_s
    "#{self.name} for #{self.price}"
  end
end
