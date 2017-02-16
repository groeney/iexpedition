class Operator < ApplicationRecord
  has_many :ships, dependent: :destroy
end
