module API
  class Base < Grape::API
    logger Rails.logger

    mount API::V1::Base

    add_swagger_documentation base_path: '/api', api_version: 'v1',
                              hide_documentation_path: true,
                              hide_format: true
  end
end