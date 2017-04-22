module API::V1
  class Messages < Grape::API
    include Grape::Kaminari

    resource :messages do
      desc 'Return paginated list of all chat messages connected with current ride',
           entity: API::Entities::Message
      paginate per_page: 20, max_per_page: 30, offset: false
      get do
        present paginate(Kaminari.paginate_array(Message.all)), with: API::Entities::Message
      end

      desc 'Create new message',
          entity: API::Entities::Message
      params do
        requires :message, type: Hash do
          requires :all, using: API::Entities::Message.documentation.except(:id, :created_at)
        end
      end
      post do
        message = Message.create(declared(params).message)
        error!({errors: message.errors}, 400) unless message.persisted?
        present message, with: API::Entities::Message
      end
    end
  end
end