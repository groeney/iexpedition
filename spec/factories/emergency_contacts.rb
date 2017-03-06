FactoryGirl.define do
  factory :emergency_contact do
    first_name {  Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { "emergency-contact-#{SecureRandom.hex(3)}@example.com" }
    relationship { ['Father', 'Child', 'Mother'].sample }
  end
end
