module API::V1
  class Movies < Grape::API
    resource :movies do
      desc 'Return all movies',
           entity: API::Entities::Movie
      get do
        present Movie.all, with: API::Entities::Movie
      end
    end
  end
end