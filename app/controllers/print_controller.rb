class PrintController < ApplicationController

  before_action :authenticate_user!, only: [:itinerary]

  layout 'print'

  def itinerary
    @order = current_user.orders.find(params[:order_id])
    @voyage = @order.try(:voyage)
  end

end
