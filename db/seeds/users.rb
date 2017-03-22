test_user = User.find_or_create_by(email: "test@example.com")
test_user.password = "password" if test_user.encrypted_password.blank?
test_user.save!