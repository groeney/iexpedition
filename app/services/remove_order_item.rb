class RemoveOrderItem < BaseService

  attr_reader :params, :order_item

  def initialize(params)
    @params = params
    @order_item = OrderItem.find_by(order_item_params)
  end

  def call
    if order_item.present?
      if order_item.productable_type != 'Cabin'
        order_item.destroy
        { success: true, message: 'Item removed' }
      else
        { success: false, message: "You can't remove this item" }
      end
    else
      { success: false, message: 'Invalid Item' }
    end
  end

  private

  def order_item_params
    params.permit(:id)
  end

end
