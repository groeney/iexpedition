class CheckoutController < ApplicationController
  include CurrentOrder
  before_action :set_order, only: [:extras, :cart, :reserve, :confirm, :checkout, :signup, :apply_coupon, :remove_order_item]
  before_action :set_user, only: [:reserve, :confirm]

  def cabins
    @cabin_grouping = CabinGrouping.find(params[:cabin_grouping_id])
    unless get_order && @order.cabin_grouping.eql?(@cabin_grouping) && @order.user.eql?(current_user)
      @order = Order.new(user: current_user, cabin_grouping: @cabin_grouping)
      @order.cabin_order_item!(@cabin_grouping.cabin)
      @order.voyage = @cabin_grouping.voyage
      @order.add_mandatory_activities
      session[:order_id] = @order.id if @order.save
      current_user.orders << @order if current_user
    end
  end

  def extras

  end

  def cart

  end

  def apply_coupon
    apply_coupon = ApplyCoupon.call(params, @order)

    respond_to do |format|
      if apply_coupon[:success]
        format.js { render 'apply_coupon_success', locals: { total_with_discount: apply_coupon[:total_with_discount],
                                                             discount: apply_coupon[:discount],
                                                             message: apply_coupon[:message] } }
      else
        format.js { render 'apply_coupon_error', locals: { message: apply_coupon[:message] } }
      end
    end
  end

  def remove_order_item
    remove_order_item = RemoveOrderItem.call(params)

    respond_to do |format|
      if remove_order_item[:success]
        format.js { render 'remove_order_item_success', locals: { message: remove_order_item[:message] } }
      else
        format.js { render 'remove_order_item_error', locals: { message: remove_order_item[:message] } }
      end
    end
  end

  def confirm
    @user = User.new
    @passengers_count = @order.cabin_order_item.qty
    @address = Address.new
  end

  def signup
    if params[:commit] == "Confirm"
      @order.send_deposit_invoice unless @order.deposit?
    elsif params[:commit] == "Reserve"
      @order.reserved!
    end
    create_passengers = CreatePassengers.call(params, @order)

    if create_passengers[:success]
      sign_in(create_passengers[:user])
      flash[:success] = create_passengers[:message]
      redirect_to dashboard_home_path
    else
      flash[:error] = create_passengers[:message]
      redirect_to checkout_confirm_path
    end
  end

  protected

  def set_user
    @user = current_user || User.new
  end
end
