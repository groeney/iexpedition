class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_personal_details_data, only: [:home, :personal_details, :update_details]
  layout "dashboard"

  def home
    render "personal_details"
  end

  def personal_details

  end

  def order_history
    @orders = current_user.orders
  end

  def confirmed_itinerary
    @order = current_user.latest_current_order
    @voyage = @order.try(:voyage)
  end

  def wishlist
    @voyages = Voyage.where(id: JSON.parse(cookies[:favourite_voyage_ids] || '[]'))
    @ships = Ship.where(id: JSON.parse(cookies[:favourite_ship_ids] || '[]'))
  end

  def payments
    @orders = current_user.orders
  end

  def download_payment_invoice
    order = Order.find(params[:id])
    if order.payment_invoice.url
      send_file(
        order.payment_invoice.url,
        filename: order.payment_invoice_file_name,
        type: order.payment_invoice_content_type
      )
    end
  end

  def download_deposit_invoice
    order = Order.find(params[:id])
    if order.deposit_invoice.url
      send_file(
        order.deposit_invoice.url,
        filename: order.deposit_invoice_file_name,
        type: order.deposit_invoice_content_type
      )
    end
  end

  def update_details
    respond_to do |format|
      if update_all_details
        format.all { render body: nil, status: 204 }
      else
        format.all { render body: nil, status: 422 }
      end
    end
  end

  protected

  def update_all_details
    update_user && update_address && update_emergency_contact &&
    update_passport && update_travel_details_pre && update_travel_details_post
  end

  def update_user
    current_user.update_attributes(user_params)
  end

  def update_address
    @address.update_attributes(address_params)
  end

  def update_emergency_contact
    @emergency_contact.update_attributes(emergency_contact_params)
  end

  def update_passport
    @passport.update_attributes(passport_params)
  end

  def update_travel_details_pre
    @travel_details_pre.update_attributes(travel_details_pre_params)
  end

  def update_travel_details_post
    @travel_details_post.update_attributes(travel_details_post_params)
  end

  def user_params
    params.fetch(:user, {}).permit(:title, :first_name, :last_name, :dob, :nationality, :email, :phone_number, :requirements, :insurance_company, :insurance_policy_number, :boot_size, :jacket_size)
  end

  def address_params
    params.fetch(:address, {}).permit(:unit, :street, :city, :postcode, :state, :country)
  end

  def emergency_contact_params
    params.fetch(:emergency_contact, {}).permit(:first_name, :last_name, :phone_number, :email, :relationship)
  end

  def passport_params
    params.fetch(:passport, {}).permit(:number, :issue_date, :expiry_date, :place_of_birth, :nationality, :image, :visa)
  end

  def travel_details_pre_params
    params.fetch(:travel_details_pre, {}).permit(:hotel_name, :hotel_address, :flight_number, :departure_airport, :departure_date, :arrival_airport, :arrival_date, :reservation_code)
  end

  def travel_details_post_params
    params.fetch(:travel_details_post, {}).permit(:hotel_name, :hotel_address, :flight_number, :departure_airport, :departure_date, :arrival_airport, :arrival_date, :reservation_code)
  end

  def set_personal_details_data
    @address = current_user.address || Address.new(user: current_user)
    @emergency_contact = current_user.emergency_contact || EmergencyContact.new(user: current_user)
    @passport = current_user.passport || Passport.new(user: current_user)
    @travel_details_pre = current_user.travel_detail_pre || TravelDetail.new(user: current_user)
    @travel_details_post = current_user.travel_detail_post || TravelDetail.new(user: current_user)
  end
end
