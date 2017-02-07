class WildlifeGrouping < ApplicationRecord
  belongs_to :wildlife
  belongs_to :wildlifable, polymorphic: true
end
