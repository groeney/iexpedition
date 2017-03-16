class OrdersController < ApplicationController
  include CurrentOrder
  before_action :set_order, only: [:update]

  def update
    respond_to do |format|
      return format.js if @order.update_attributes(solo_traveller: order_params[:solo_traveller])
      format.js { render 'error' }
    end
  end

  private

  def order_params
    params.require(:order).permit(:id, :solo_traveller)
  end
end
