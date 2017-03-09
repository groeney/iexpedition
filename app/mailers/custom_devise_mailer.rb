class CustomDeviseMailer < BaseMandrillMailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  # Overrides same inside Devise::Mailer
  def confirmation_instructions(record, token, opts={})
    attributes = {
      email: record.email,
      confirmation_url: user_confirmation_url(confirmation_token: token)
    }
    make_email(record.email, Rails.application.config.email_meta_data[:confirm_email], attributes)
  end

  # Overrides same inside Devise::Mailer
  def reset_password_instructions(record, token, opts={})
    attributes = {
      full_name: record.full_name,
      reset_password_url: edit_user_password_url(record, reset_password_token: token)
    }
    make_email(record.email, Rails.application.config.email_meta_data[:reset_password], attributes)
  end
end