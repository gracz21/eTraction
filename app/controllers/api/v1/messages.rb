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

      desc 'Create new message', {
          success: { model: API::Entities::Message },
          failure: [ { code: 401, message: 'Unauthorized' } ],
          headers: {
              'Device-Id' => {
                  description: 'Android device identifier',
                  required: true
              }
          }
      }
      params do
        requires :message, type: Hash do
          requires :all, using: API::Entities::Message.documentation.except(:id, :author, :created_at)
        end
      end
      post do
        error!('Unauthorized', 401) if headers['Device-Id'].nil?
        user = User.find_by(device_id: headers['Device-Id'])
        error!('Unauthorized', 401) if user.nil?

        message = user.messages.create(declared(params).message)
        error!({errors: message.errors}, 400) unless message.persisted?
        present message, with: API::Entities::Message
      end
    end
  end
end