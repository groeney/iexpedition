class ContactRequestsController < ApplicationController

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    respond_to do |format|
      if @contact_request.save
        NotifierMailer.contact_us(@contact_request).deliver_now
        format.js
      else
        format.js { render 'error' }
      end
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:first_name, :last_name, :email, :phone_number,
                                            :destination, :travel_date, :number_of_people, :message)
  end

end
