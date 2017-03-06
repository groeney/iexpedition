FactoryGirl.define do
  factory :passport do
    number { SecureRandom.hex(5) }
    issue_date { 3.years.ago }
    expiry_date { 7.years.from_now }
    place_of_birth { Faker::Address.city }
    nationality { Faker::Address.country }
  end
end
