class VoyageDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::NumberHelper

  def from_price
    "#{object.currency} #{number_to_currency(object.from_price, precision: 0)}"
  end
end
