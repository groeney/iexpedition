class Cabin < ApplicationRecord
  has_many :cabin_groupings
  has_many :feature_groupings, as: :featurable

  has_many :voyages, through: :cabin_groupings
  has_many :features, through: :feature_groupings
end
