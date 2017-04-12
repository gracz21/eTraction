FactoryGirl.define do
  factory :stop do
    name { Faker::Address.city }
  end
end
