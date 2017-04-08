module API::V1
  class Root < Grape::API
    format :json
    add_swagger_documentation
  end
end