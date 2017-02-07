class ActivityGrouping < ApplicationRecord
  belongs_to :activity
  belongs_to :voyage

  # Validates uniqueness of price, activity.name and voyage_id
end
