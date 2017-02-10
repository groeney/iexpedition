class WildlifeGrouping < ApplicationRecord
  belongs_to :wildlife
  belongs_to :wildlifable, polymorphic: true

  validates_uniqueness_of :wildlife_id, scope: [:wildlifable_type, :wildlifable_id], message: "wildlife already exists for this resource"
end
