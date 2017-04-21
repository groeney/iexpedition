class UserMailer < ApplicationMailer

  def send_itinerary_to_email(user, voyage)
    pdf = WickedPdf.new.pdf_from_string(render_to_string(partial: 'includes/voyage/itinerary_tab', locals: { voyage: voyage }))
    attachments['itinerary.pdf'] = pdf

    if Rails.env.development? || Rails.env.test?
      log = "\n\n\n\n\n"
      log += "#############   EMAIL SENT TO: #{email}   ############\n"
      log += "with itinerary pdf attachment"
      log += "###########################################################"
      log += "\n\n\n\n\n"
      Rails.logger.info log
    else
      mail(to: user.email, subject: "Your itinerary")
    end
  end
end
