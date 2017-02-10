class Exclusion < ApplicationRecord
  has_many :exclusion_groupings, dependent: :destroy
  has_many :voyages, through: :exclusion_groupings

  validates_uniqueness_of :name
end
