module API::V1
  class Base < Grape::API
    default_format :json
    format :json
    version 'v1'

    mount API::V1::Cameras
    mount API::V1::Movies
    mount API::V1::Statements
  end
end