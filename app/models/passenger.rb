class Passenger < ApplicationRecord
  belongs_to :order

  validates_presence_of [:order_item_id]
end
