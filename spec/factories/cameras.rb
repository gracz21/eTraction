FactoryGirl.define do
  factory :camera do
    name { Faker::Internet.domain_word }
    url { Faker::Internet.url }
  end
end
