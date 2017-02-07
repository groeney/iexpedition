class Highlight < ApplicationRecord
  has_many :highlight_groupings

  has_many :destinations, through: :highlight_groupings, source: :highlightable, source_type: "Destination"
  has_many :regions, through: :highlight_groupings, source: :highlightable, source_type: "Region"
  has_many :voyages, through: :highlight_groupings, source: :highlightable, source_type: "Voyage"
end
