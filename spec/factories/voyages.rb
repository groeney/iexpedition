FactoryGirl.define do
  factory :voyage do
    name { Faker::LordOfTheRings.location }
    start_date { rand(100.days.from_now..1.year.from_now) }
    end_date { rand(start_date..1.year.from_now) }
  end
end
