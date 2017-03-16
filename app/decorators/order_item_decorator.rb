class OrderItemDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::NumberHelper

  def price
    "#{currency} #{number_to_currency(object.price, precision: 0)}"
  end

  def total
    "#{currency} #{number_to_currency(object.total, precision: 0)}"
  end

  def description
    case object.productable_type
      when 'Cabin'
        object.productable.description
      when 'Activity'
        object.productable.overview
    end
  end

  private

  def currency
    object.voyage.currency
  end
end
