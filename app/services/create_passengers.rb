class CreatePassengers < BaseService

  attr_reader :params, :order

  def initialize(params, order)
    @params = params
    @order = order
  end

  def call
    if order.has_exactly_one_cabin
      user = create_user

      if user.persisted?
        create_passenger
        { success: true, message: 'Congratulations! Your booking is complete. We will be in touch shortly.', user: user }
      else
        { success: false, message: 'Error' }
      end
    else
      { success: false, message: 'Error' }
    end
  end

  private

  def user_params
    params.require(:order_details).require(:user).permit(:gender, :first_name, :last_name,
                                                         :email, :phone_number, :dob,
                                                         :nationality, :password)
  end

  def passengers_params
    order_details = params.require(:order_details)
    order_details.keys.grep(/user_/).map { |key| order_details[key].permit(:gender, :first_name, :last_name,
                                                                           :email, :phone_number, :dob,
                                                                           :nationality, :password) }
  end

  def passengers_with_order
    passengers_params.map { |passenger| passenger.merge(order_id: order_id) }
  end

  def order_id
    order.id
  end

  def address_params
    params.require(:order_details).require(:address).permit(:unit, :street, :city, :postcode, :state, :country)
  end

  def create_user
    user = User.new(user_params)
    user.orders << order
    user.skip_confirmation!
    if user.save
      address = Address.new(address_params)
      address.user = user
      address.save
    end
    user
  end

  def create_passenger
    Passenger.create(passengers_with_order) if passengers_params.present?
  end

end
