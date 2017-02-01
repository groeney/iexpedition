class Voyage < ApplicationRecord
  belongs_to :ship
  has_many :cabins
  has_many :activities
end
