class Order < ApplicationRecord
  has_many :order_items
  has_many :passengers
  belongs_to :coupon
  belongs_to :voyage
  belongs_to :user # Only after status becomes > reserved

  enum status: [:cart, :reserved, :deposit, :confirmed, :paid, :active, :expired]
  # - :deposit: the deposit has been requested
  # - :confirmed: the deposit has been paid
  # - :active: current date is within voyage.start_date & voyage.end_date
  # - :expired: current date is after voyage.end_date

  # validate :has_one_cabin
  validates_presence_of [:voyage_id]

  def add_product(product, qty=1)
    current_item = self.order_items.find_by({
      productable_id: product.id, productable_type: product.class.name
      })

    if current_item
      current_item.qty += qty
      current_item.save
    else
      current_item = self.order_items.build({ productable: product })
    end
    current_item
  end

  def has_one_cabin
    cabins = 0
    order_items.each do |order_item|
      cabins += (order_item.productable_type.eql? "Cabin") ? 1 : 0
    end
    cabins == 1
  end

  def sub_total
    order_items.pluck(:price).sum
  end

  def total
    self.sub_total * (1 + self.voyage.gst_perc)
  end

  def cabin_order_item
    order_items.find_by({ productable_type: "Cabin" })
  end

  def cabin_order_item!(cabin)
    self.cabin_order_item.try(:destroy)
    self.add_product(cabin)
  end

  def send_deposit_invoice
     # send invoice through to xero integration
     self.deposit!
  end
end
