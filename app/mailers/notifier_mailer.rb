class NotifierMailer < ApplicationMailer
  default(
    from: "info@iexpedition.com",
    reply_to: "info@iexpedition.com"
  )

  def contact_us(contact_request)
    @contact_request = contact_request

    if Rails.env.development? || Rails.env.test?
      write_to_cmd_line("info@iexpedition.com", "New Contact Request", contact_request)
    else
      mail(to: "info@iexpedition.com", subject: "New Contact Request")
    end
  end

  private

  # used only for development
  def write_to_cmd_line(email, email_id, content)
    log = "\n\n\n\n\n"
    log += "#############   EMAIL SENT TO: #{email}   ############\n"
    log += "TEMPLATE: #{email_id}\n"
    log += "#{content.inspect}\n"
    log += "###########################################################"
    log += "\n\n\n\n\n"
    Rails.logger.info log
  end
end
