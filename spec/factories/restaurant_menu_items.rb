FactoryGirl.define do
  factory :restaurant_menu_item do
    name { Faker::Food.ingredient }
    price { rand(1.00..20.00).round(2) }
  end
end
