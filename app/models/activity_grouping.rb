class ActivityGrouping < ApplicationRecord
  belongs_to :activity
  belongs_to :voyage

  validates_uniqueness_of :activity_id, scope: :voyage_id, message: "same activity can only exist once per voyage"
  validates_presence_of [:activity, :voyage]
end
