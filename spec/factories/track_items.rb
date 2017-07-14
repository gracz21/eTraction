FactoryGirl.define do
  factory :track_item do
    travel_time { rand(30..60) }
    down_time { rand(5..15) }
  end
end
