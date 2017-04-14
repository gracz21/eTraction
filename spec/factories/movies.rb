FactoryGirl.define do
  factory :movie do
    title { Faker::Book.title }
    genre { Faker::Book.genre }
    length { rand(60..150) }
    poster 'placeholder'
    filename 'placeholder'
  end
end
