module API::V1
  class Users < Grape::API
    rescue_from ActiveRecord::RecordNotFound do |e|
      error!({errors: e.message}, 404)
    end

    resource :users do
      desc 'Return anonymous user based on given device identifier', {
          success: { model: API::Entities::User },
          failure: [ { code: 401, message: 'Unauthorized' },
                     {code: 404, message: 'User not found'} ],
          headers: {
              'Device-Id' => {
                  description: 'Android device identifier',
                  required: true
              }
          }
      }
      get do
        error!('Unauthorized', 401) if headers['Device-Id'].nil?

        present User.find_by!(device_id: headers['Device-Id']), with: API::Entities::User
      end

      desc 'Create new anonymous user', {
          success: { model: API::Entities::User },
          failure: [ {code: 400, message: 'Wrong request parameters'},
                     { code: 401, message: 'Unauthorized' } ],
          headers: {
              'Device-Id' => {
                  description: 'Android device identifier',
                  required: true
              }
          }
      }
      params do
        requires :user, type: Hash do
          requires :all, using: API::Entities::User.documentation.except(:id)
        end
      end
      post do
        error!('Unauthorized', 401) if headers['Device-Id'].nil?

        user = User.create(username: declared(params).user[:username], device_id: headers['Device-Id'])
        error!({errors: user.errors}, 400) unless user.persisted?
        present user, with: API::Entities::User
      end

      desc 'Update user', {
          success: { model: API::Entities::User },
          failure: [ { code: 401, message: 'Unauthorized' } ],
          headers: {
              'Device-Id' => {
                  description: 'Android device identifier',
                  required: true
              }
          }
      }
      params do
        requires :user, type: Hash do
          requires :all, using: API::Entities::User.documentation.except(:id)
        end
      end
      put do
        error!('Unauthorized', 401) if headers['Device-Id'].nil?
        user = User.find_by(device_id: headers['Device-Id'])
        error!('Unauthorized', 401) if user.nil?

        error!({errors: user.errors}, 400) unless user.update(declared(params).user)
        present user, with: API::Entities::User
      end
    end
  end
end