class History < ApplicationRecord
  belongs_to :destination
  validates_uniqueness_of :name
  validates_presence_of [:name, :overview, :destination]
end
