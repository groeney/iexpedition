FactoryGirl.define do
  factory :activity do
    name { ["Kayaking", "Camping", "Snow Shoeing"].sample }
    overview { Faker::Lorem.paragraph }
  end
end
