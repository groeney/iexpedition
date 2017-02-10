admin = AdminUser.find_or_create_by(email: "admin@example.com")
admin.password = "password" if admin.encrypted_password.blank?
admin.save!