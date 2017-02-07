class Wildlife < ApplicationRecord
  has_many :wildlife_groupings

  has_many :voyages, through: :wildlife_groupings, source: :wildlifable, source_type: "Voyage"
  has_many :regions, through: :wildlife_groupings, source: :wildlifable, source_type: "Region"
end
