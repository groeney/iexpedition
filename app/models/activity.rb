class Activity < ApplicationRecord
  has_many :activity_groupings
  has_many :voyages, through: :activity_groupings
end
