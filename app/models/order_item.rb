class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :productable, polymorphic: true
  has_many :passengers

  validates_presence_of [:order, :productable_id, :productable_type]

  def price

  end
end
