FactoryGirl.define do
  factory :track_item do
    travel_time { rand(1..60) }
  end
end
