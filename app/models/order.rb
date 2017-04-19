class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :passengers, dependent: :destroy
  has_many :vouchers, dependent: :destroy
  accepts_nested_attributes_for :vouchers, allow_destroy: true
  belongs_to :coupon
  belongs_to :voyage
  belongs_to :user # Only after status becomes > reserved
  belongs_to :cabin_grouping

  after_create :add_mandatory_activities

  enum status: [:cart, :reserved, :deposit, :confirmed, :paid, :active, :expired]
  # - :deposit: the deposit has been requested
  # - :confirmed: the deposit has been paid
  # - :active: current date is within voyage.start_date & voyage.end_date
  # - :expired: current date is after voyage.end_date

  has_attached_file :deposit_invoice
  has_attached_file :payment_invoice
  validates_attachment_content_type :deposit_invoice, :payment_invoice, content_type: %w(application/pdf)

  validate :has_exactly_one_cabin
  validates_presence_of [:voyage_id]

  def add_product(product, qty = 1)
    current_item = self.order_items.find_by({
      productable_id: product.id, productable_type: product.class.name
      })

    if current_item
      current_item.qty += qty
      current_item.save
    else
      current_item = self.order_items.build({ productable: product, qty: qty })
    end
    current_item
  end

  def add_mandatory_activities
    voyage.activities.select(&:is_mandatory).each { |activity| add_product(activity) }
    save
  end

  def has_exactly_one_cabin
    order_items.where(productable_type: "Cabin").count == 1
  end

  def sub_total
    order_items.map(&:total).sum
  end

  def total
    (self.sub_total + self.solo_traveller_fee) + self.tax_amount - self.discount_in_dollars
  end

  def tax_amount
    (self.sub_total + self.solo_traveller_fee) * self.voyage.gst_perc
  end

  def cabin_order_item
    order_items.find_by({ productable_type: "Cabin" })
  end

  def cabin_order_item!(cabin)
    self.cabin_order_item.try(:destroy)
    self.add_product(cabin)
  end

  def send_deposit_invoice
     self.deposit!
  end

  def cabin
    self.cabin_order_item.productable
  end

  def solo_traveller_fee
    return 0 unless self.solo_traveller
    self.cabin.additional_single_supp
  end

  def discount_in_dollars
    if self.coupon
      self.coupon.discount_in_dollars(self.sub_total + self.solo_traveller_fee)
    else
      0
    end
  end

  def deposit_perc_amount
    return 0 unless self.deposit_perc
    (self.deposit_perc / 100) * self.total
  end
end
