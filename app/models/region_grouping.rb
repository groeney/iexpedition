class RegionGrouping < ApplicationRecord
  belongs_to :region
  belongs_to :voyage

  validates_presence_of [:region, :voyage]
  validates_uniqueness_of :region_id, scope: :voyage_id, message: "same region can only exist once per voyage"
end
