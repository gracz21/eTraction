module API::V1
  class Statements < Grape::API
    resource :statements do
      desc 'Return all statements connected with current ride',
           entity: API::Entities::Statement
      get do
        present Statement.all, with: API::Entities::Statement
      end
    end
  end
end