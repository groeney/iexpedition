module CurrentOrder
  extend ActiveSupport::Concern

    private

      def set_order
        @order = Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
        @order = Order.new user: current_user
      end
end