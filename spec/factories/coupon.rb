FactoryGirl.define do
  factory :coupon do
    code 'foo'
    discount_amount { rand(250) }
    discount_type :dollar
  end
end
