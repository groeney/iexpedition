FactoryGirl.define do
  factory :travel_detail do
    hotel_address { Faker::Address.street_address }
    departure_airport { Faker::Address.city }
    departure_date { 3.months.from_now }
    arrival_airport { Faker::Address.city }
    arrival_date { 3.months.from_now }
    reservation_code { SecureRandom.hex(5) }
  end
end
