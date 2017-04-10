test_user = User.find_or_create_by(email: "test@example.com")
test_user.password = "password"
test_user.save!