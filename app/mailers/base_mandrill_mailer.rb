require "mandrill"
class BaseMandrillMailer < Devise::Mailer
  default(
    from: "admin1@iexpedition.com",
    reply_to: "admin1@iexpedition.com"
  )

  private

  def make_email(email, meta_data, attributes)
    if Rails.env.development? || Rails.env.test?
      write_to_cmd_line(email, meta_data["id"], attributes.inspect)
    else
      send_email(email, meta_data, attributes)
    end
  end

  # used only for development
  def write_to_cmd_line(email, email_id, content)
    log = "\n\n\n\n\n"
    log += "#############   EMAIL SENT TO: #{email}   ############\n"
    log += "TEMPLATE: #{email_id}\n"
    log += "#{content}\n"
    log += "###########################################################"
    log += "\n\n\n\n\n"
    Rails.logger.info log
  end

  def send_email(email, meta_data, attributes)
    return if email.split("@")[1] == "example.com"
    body = mandrill_template(meta_data["id"], attributes)
    subject = meta_data["subject"]
    mail(to: email, subject: subject, body: body, content_type: "text/html")
  end

  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end
end