module API::V1
  class Base < Grape::API
    default_format :json
    format :json
    version 'v1'

    mount API::V1::Cameras
    mount API::V1::Messages
    mount API::V1::Movies
    mount API::V1::RestaurantMenuItems
    mount API::V1::Statements
    mount API::V1::Tracks
    mount API::V1::Users
    mount API::V1::UserVideos
  end
end