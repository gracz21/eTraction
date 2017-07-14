FactoryGirl.define do
  factory :restaurant_menu_item do
    name { Faker::Food.ingredient }
    price { rand(1.00..20.00).round(2) }
    image { Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'fixtures', 'picture.png'), 'image/png') }
    weight { rand(100..600) }
  end
end
