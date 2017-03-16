class Coupon < ApplicationRecord
  enum discount_type: [:percentage, :dollar]
  has_many :orders

  def calculate_discount(amount)
    amount - self.discount_in_dollars(amount)
  end

  def discount_in_dollars(amount)
    if self.percentage?
      amount * (self.discount_amount/100.0)
    else self.dollar?
      self.discount_amount
    end
  end
end
