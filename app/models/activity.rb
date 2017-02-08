class Activity < ApplicationRecord
  has_many :activity_groupings
  has_many :voyages, through: :activity_groupings
  def identifier_s
    "#{self.name} for #{self.price}"
  end
end
