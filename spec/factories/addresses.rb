FactoryGirl.define do
  factory :address do
    unit { Faker::Address.building_number }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    state { Faker::Address.state }
    country { Faker::Address.country }
  end
end
