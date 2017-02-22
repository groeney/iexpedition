class WildlifeGrouping < ApplicationRecord
  belongs_to :wildlife
  belongs_to :destination

  validates_uniqueness_of :wildlife_id, scope: :voyage_id, message: "wildlife already exists for this resource"
  validates_presence_of [:wildlife, :destination]
end
