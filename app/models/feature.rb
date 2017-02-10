class Feature < ApplicationRecord
  has_many :feature_groupings, dependent: :destroy

  has_many :cabins, through: :feature_groupings, source: :featurable, source_type: "Cabin"
  has_many :ships, through: :feature_groupings, source: :featurable, source_type: "Ship"

  validates_presence_of [:name, :icon]
  validates_uniqueness_of :name

  def self.featurables
    Cabin.all + Ship.all
  end
end
