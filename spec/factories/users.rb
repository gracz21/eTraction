FactoryGirl.define do
  factory :user do
    device_id { SecureRandom.uuid }
    username { Faker::Name.name }
  end
end
