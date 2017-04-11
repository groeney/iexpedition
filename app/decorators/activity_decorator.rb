class ActivityDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::NumberHelper

  def price
    "#{currency} #{number_to_currency(object.price, precision: 0)}"
  end

  private

  def currency
    object.voyages.first.currency
  end
end
