class CabinDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::NumberHelper

  def price
    "#{currency} #{number_to_currency(object.price, precision: 0)}"
  end

  def price_with_discount(discount_amount)
    "#{currency} #{number_to_currency(object.price - discount_amount, precision: 0)}"
  end

  private

  def currency
    object.voyages.first.currency
  end
end
