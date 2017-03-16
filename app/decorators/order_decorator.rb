class OrderDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::NumberHelper

  def sub_total
    "#{currency} #{number_to_currency(object.sub_total, precision: 0)}"
  end

  def tax
    "#{currency} #{number_to_currency(object.voyage.gst_perc, precision: 0)}"
  end

  def deposit_perc
    number_to_percentage object.deposit_perc, precision: 0
  end

  def total
    "#{currency} #{number_to_currency(object.total, precision: 0)}"
  end

  def total_with_discount
    "#{currency} #{number_to_currency(object.coupon.calculate_discount(object.total), precision: 0)}"
  end

  def total_or_with_discount
    object.coupon.present? ? object.decorate.total_with_discount : object.decorate.total
  end

  def discount_amount
    if object.coupon
      "#{currency} #{number_to_currency(object.discount_in_dollars, precision: 0)}"
    else
      0
    end
  end

  def solo_traveller_fee
    "#{currency} #{number_to_currency(object.solo_traveller_fee, precision: 0)}"
  end

  private

  def currency
    object.voyage.currency
  end

end
