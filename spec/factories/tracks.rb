FactoryGirl.define do
  factory :track do
    name { "#{Faker::Address.city} - #{Faker::Address.city}" }
  end
end
