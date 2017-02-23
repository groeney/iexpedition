FactoryGirl.define do
  factory :itinerary_day do
    name { Faker::Name.name }
    overview { Faker::Lorem.paragraph }
  end
end
