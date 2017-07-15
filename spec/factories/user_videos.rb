FactoryGirl.define do
  factory :user_video do
    video { Rack::Test::UploadedFile.new(
        File.join(Rails.root, 'spec', 'fixtures', 'movie.mp4'), 'video/mp4') }
    title { Faker::Book.title }
  end
end
