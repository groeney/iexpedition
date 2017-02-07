class Feature < ApplicationRecord
  has_many :feature_groupings

  has_many :cabins, through: :feature_groupings, source: :featurable, source_type: "Cabin"
  has_many :ships, through: :feature_groupings, source: :featurable, source_type: "Ship"
end
