class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :productable, polymorphic: true
  has_many :passengers

  after_update :update_qty

  validates_presence_of [:order, :productable_id, :productable_type, :qty]
  validate :valid_qty

  scope :activities, -> { where(productable_type: "Activity") }

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

  private

  def update_qty
    if self.productable_type == 'Cabin'
      order.order_items.activities
        .select { |activity| activity.productable.is_mandatory }
        .each { |activity| activity.update(qty: qty) }
    end
  end
end
