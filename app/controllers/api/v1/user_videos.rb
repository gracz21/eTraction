module API::V1
  class UserVideos < Grape::API
    include Grape::Kaminari

    resource :user_videos do
      desc 'Return paginated list of all user videos connected with current ride',
           entity: API::Entities::UserVideo
      paginate per_page: 20, max_per_page: 30, offset: false
      get do
        present paginate(Kaminari.paginate_array(Ride.last.user_videos)), with: API::Entities::UserVideo
      end

      desc 'Create new user video', {
          success: { model: API::Entities::UserVideo },
          failure: [ {code: 400, message: 'Missing/invalid request parameters'},
                     { code: 401, message: 'Unauthorized' } ],
          headers: {
              'Device-Id' => {
                  description: 'Android device identifier',
                  required: true
              }
          }
      }
      params do
        requires :user_video, type: Hash do
          requires :title, type: String, desc: 'Video title'
          requires :video, type: File, desc: 'Video file'
        end
      end
      post do
        error!('Unauthorized', 401) if headers['Device-Id'].nil?
        user = User.find_by(device_id: headers['Device-Id'])
        error!('Unauthorized', 401) if user.nil?

        user_video = user.user_videos.create(declared(params).user_video)
        error!({errors: user_video.errors}, 400) unless user_video.persisted?
        present user_video, with: API::Entities::UserVideo
      end

      desc 'Destroy an user video', {
          success: { model: API::Entities::UserVideo },
          failure: [ {code: 400, message: 'Missing/invalid request parameters'},
                     { code: 401, message: 'Unauthorized' },
                     {code: 403, message: 'Forbidden'} ],
          headers: {
              'Device-Id' => {
                  description: 'Android device identifier',
                  required: true
              }
          }
      }
      params do
        requires :id, type: Integer, desc: 'User video id'
      end
      delete ':id' do
        error!('Unauthorized', 401) if headers['Device-Id'].nil?
        user = User.find_by(device_id: headers['Device-Id'])
        error!('Unauthorized', 401) if user.nil?

        user_video = UserVideo.find_by_id(params[:id])
        error!('Forbidden', 403) unless user_video.user == user

        user_video.destroy
        status 200
      end
    end
  end
end