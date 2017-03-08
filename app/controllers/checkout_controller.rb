class CheckoutController < ApplicationController
  include CurrentOrder
  before_action :set_order, only: [:extras, :cart, :reserve, :confirm, :checkout, :signup]
  before_action :set_user, only: [:reserve, :confirm]

  # Creates new order every time
  def cabins
    @cabin_grouping = CabinGrouping.find(params[:cabin_grouping_id])

    @order = Order.new(user: current_user)
    @order_item = @order.cabin_order_item! @cabin_grouping.cabin
    @order.voyage = @cabin_grouping.voyage
    session[:order_id] = @order.id if @order.save
    current_user.orders << @order if current_user
  end

  def extras

  end

  def cart

  end

  def confirm

  end

  def signup
    if params[:commit] == "Confirm"
      @order.send_deposit_invoice unless @order.deposit?
    elsif params[:commit] == "Reserve"
      @order.reserved!
    end
    # validate @order.has_one_cabin
    # map passenger 1 and address details to create a new @user
    # create all passenger records and associate them with @order
    # sign_in @user
    # redirect to dashboard#home
  end

  protected

  def set_user
    @user = current_user || User.new
  end
end
