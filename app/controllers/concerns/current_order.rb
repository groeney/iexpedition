module CurrentOrder
  extend ActiveSupport::Concern

    private

      def set_order
        @order = Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
        @order = Order.new user: current_user
      end

      def get_order
        @order = Order.find_by(id: session[:order_id])
      end
end