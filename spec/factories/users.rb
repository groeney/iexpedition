FactoryGirl.define do
  factory :user do
    title { ["Mr", "Mrs", "Miss"].sample }
    first_name {  Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    dob { 21.years.ago }
    phone_number { Faker::PhoneNumber.cell_phone }
    requirements { Faker::Lorem.paragraph }

    insurance_company { Faker::Company.name }
    insurance_policy_number { SecureRandom.hex(5) }

    boot_size { ['39', '40', '41', '42'].sample }
    jacket_size { ['39', '40', '41', '42'].sample }
    gender { ['male', 'female'].sample }

    email { "foo@bar.com" }
    password "password"

    before(:create) { |user| user.skip_confirmation!  }

    trait :with_reserved_order do
      after(:create) do |user|
        order = FactoryGirl.create(:order, :with_order_items, user: user)
        order.reserved!
      end
    end

    trait :with_deposit_order do
      after(:create) do |user|
        order = FactoryGirl.create(:order, :with_order_items, user: user)
        order.send_deposit_invoice
      end
    end

    trait :with_wishlist do
      transient do
        voyages nil
        ships nil
      end
      after(:create) do |user, evaluator|
        user.wishlist_voyages << (evaluator.voyages || Voyage.all.sample(4))
        user.wishlist_ships << (evaluator.ships || Ship.all.sample(4))
      end
    end

    trait :with_address do
      after(:create) do |user|
        user.address = FactoryGirl.create(:address)
      end
    end

    trait :with_passport do
      after(:create) do |user|
        user.passport = FactoryGirl.create(:passport)
      end
    end

    trait :with_emergency_contact do
      after(:create) do |user|
        user.emergency_contact = FactoryGirl.create(:emergency_contact)
      end
    end

    trait :with_travel_details do
      after(:create) do |user|
        user.travel_detail_pre = FactoryGirl.create(:travel_detail)
        user.travel_detail_post = FactoryGirl.create(:travel_detail, departure_date: user.travel_detail_pre.departure_date + 2.weeks, arrival_date: user.travel_detail_pre.arrival_date + 2.weeks)
      end
    end

    trait :with_travel_details do
      after(:create) do |user|
        user.travel_detail_pre = FactoryGirl.create(:travel_detail)
        user.travel_detail_post = FactoryGirl.create(:travel_detail, departure_date: user.travel_detail_pre.departure_date + 2.weeks, arrival_date: user.travel_detail_pre.arrival_date + 2.weeks)
      end
    end
  end
end
