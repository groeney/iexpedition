class ApplicationMailer < ActionMailer::Base
  default(
    from: "info@iexpedition.com",
    reply_to: "info@iexpedition.com"
  )
  layout 'mailer'
end
