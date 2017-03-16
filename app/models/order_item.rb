class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :productable, polymorphic: true
  has_many :passengers

  validates_presence_of [:order, :productable_id, :productable_type, :qty]
  validate :valid_qty

  def price
    self.productable.price
  end

  def total
    self.productable.price * self.qty
  end

  def voyage
    self.order.voyage
  end

  def valid_qty
    self.qty > 0
  end
end
