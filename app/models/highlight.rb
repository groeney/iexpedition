class Highlight < ApplicationRecord
  has_many :highlight_groupings, dependent: :destroy

  has_many :destinations, through: :highlight_groupings, source: :highlightable, source_type: "Destination"
  has_many :regions, through: :highlight_groupings, source: :highlightable, source_type: "Region"
  has_many :voyages, through: :highlight_groupings, source: :highlightable, source_type: "Voyage"

  has_attached_file :image, default_url: "/assets/missing-highlight.png"

  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\z/ }
  validates_uniqueness_of :name, scope: [:overview, :label], message: ", overview and label should be unique combinations"
  # validates_presence_of [:name, :overview]

  def self.highlightables
    Destination.all + Region.all + Voyage.all
  end
end
