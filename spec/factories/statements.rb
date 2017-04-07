FactoryGirl.define do
  factory :statement do
    title Faker::Name.title
    name 'Some statement text'
  end
end
