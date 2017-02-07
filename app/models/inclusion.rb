class Inclusion < ApplicationRecord
  has_many :inclusion_groupings
  has_many :voyages, through: :inclusion_groupings
end
