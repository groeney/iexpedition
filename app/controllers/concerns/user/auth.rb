module User::Auth
  extend ActiveSupport::Concern

  included do
    has_many :identities, dependent: :destroy
  end

  class_methods do
    TEMP_EMAIL_PREFIX = 'change@me'

    def find_for_oauth(auth, signed_in_resource = nil)
      identity = Identity.find_for_oauth(auth)

      user = signed_in_resource ? signed_in_resource : identity.user

      if user.nil?
        email = auth.info.email
        user = User.where(email: email).first if email

        if user.nil?
          user = User.new(
            first_name: auth.info.first_name,
            last_name: auth.info.last_name,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20],
          )
          user.skip_confirmation!
          user.save!
        end
      end

      if identity.user != user
        identity.user = user
        identity.save!
      end
      user
    end
  end
end
