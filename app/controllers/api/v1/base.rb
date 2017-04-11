module API::V1
  class Base < Grape::API
    format :json
    version 'v1'

    mount API::V1::Statements
  end
end