FactoryGirl.define do
  factory :activity do
    name { ["Kayaking", "Camping", "Snow Shoeing"].sample }
    overview { Faker::Lorem.paragraph }
    price { rand(250) }
  end
end
