class ApplyCoupon < BaseService

  attr_reader :params, :order, :coupon

  def initialize(params, order)
    @params = params
    @order = order
    @coupon = Coupon.find_by(coupon_params)
  end

  def call
    if coupon.present?
      if order.coupon.present?
        { success: false, message: 'You already used the coupon' }
      else
        order.coupon = coupon
        order.save
        { success: true, message: 'Discount applied',
          total_with_discount: order.decorate.total_with_discount, discount: order.decorate.discount_amount }
      end
    else
      { success: false, message: 'Invalid coupon' }
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:code)
  end

end
