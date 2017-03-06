FactoryGirl.define do
  factory :order do
    voyage { Voyage.all.sample }
    user { User.all.sample }

    trait :with_order_items do
      after(:create) do |order|
        cabin_order_item = FactoryGirl.create(:order_item, order: order, productable: order.voyage.cabins.sample)

        unless order.voyage.activities.empty?
          FactoryGirl.create(:order_item, order: order, productable: order.voyage.activities.sample)
        end
      end
    end
  end
end
