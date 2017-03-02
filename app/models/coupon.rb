class Coupon < ApplicationRecord
  enum discount_type: [:percentage, :dollar]
  has_many :orders

  def calculate_discount(amount)
    if self.percentage?
      amount * (self.discount_amount/100.0)
    elsif self.dollar?
      amount - self.discount_amount
    end
  end
end
