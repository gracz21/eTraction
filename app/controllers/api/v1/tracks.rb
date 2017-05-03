module API
  module V1
    class Tracks < Grape::API
      resource :tracks do
        desc 'Return track of current ride',
             entity: API::Entities::Track
        get do
          present Ride.last.track, with: API::Entities::Track
        end
      end
    end
  end
end