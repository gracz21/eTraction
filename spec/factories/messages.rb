FactoryGirl.define do
  factory :message do
    text { Faker::Twitter.status[:text] }
  end
end
