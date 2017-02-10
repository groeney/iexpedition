class InclusionGrouping < ApplicationRecord
  belongs_to :inclusion
  belongs_to :voyage

  validates_uniqueness_of :inclusion_id, scope: :voyage_id, message: "inclusion already exists for voyage"
  validates_presence_of [:inclusion, :voyage]
end
