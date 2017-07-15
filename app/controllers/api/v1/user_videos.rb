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
    end
  end
end