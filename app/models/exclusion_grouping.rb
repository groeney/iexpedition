class ExclusionGrouping < ApplicationRecord
  belongs_to :exclusion
  belongs_to :voyage

  validates_presence_of [:exclusion, :voyage]
  validates_uniqueness_of :exclusion_id, scope: :voyage_id, message: "same exclusion can only exist once per voyage"
end
