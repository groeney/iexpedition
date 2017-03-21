class WildlifeGrouping < ApplicationRecord
  belongs_to :wildlife
  belongs_to :destination

  validates_uniqueness_of :wildlife_id, scope: :destination_id, message: "wildlife already exists for this destination"
  validates_presence_of [:wildlife, :destination]
end
