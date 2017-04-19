module API::V1
  class Cameras < Grape::API
    resource :cameras do
      desc 'Return all cameras',
           entity: API::Entities::Camera
      get do
        present Camera.all, with: API::Entities::Camera
      end
    end
  end
end