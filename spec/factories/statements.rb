FactoryGirl.define do
  factory :statement do
    title { Faker::Name.title }
    text 'Some statement text'
  end
end
