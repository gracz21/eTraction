FactoryGirl.define do
  factory :stop do
    name { Faker::Address.city }
    address { Faker::Address.full_address }
  end
end
