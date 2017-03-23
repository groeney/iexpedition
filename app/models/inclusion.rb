class Inclusion < ApplicationRecord
  has_many :inclusion_groupings, dependent: :destroy
  has_many :voyages, through: :inclusion_groupings

  has_attached_file :image, default_url: "/assets/missing.png"
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }

  validates_uniqueness_of :name, scope: [:overview], message: " and overview must be unique combinations"
  validates_presence_of :name
end
