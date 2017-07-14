FactoryGirl.define do
  factory :movie do
    title { Faker::Book.title }
    genre { Faker::Book.genre }
    length { rand(60..150) }
    poster { Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'fixtures', 'picture.png'), 'image/png') }
    filename { Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'fixtures', 'movie.mp4'), 'video/mp4') }
  end
end
