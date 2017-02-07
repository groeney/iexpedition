class Exclusion < ApplicationRecord
  has_many :exclusion_groupings
  has_many :voyages, through: :exclusion_groupings
end
