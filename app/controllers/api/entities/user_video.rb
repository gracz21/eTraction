module API::Entities
  class UserVideo < Grape::Entity
    root :user_videos, :user_video

    expose :id, documentation: { type: Integer, presence: true }
    expose :title, documentation: { type: String, desc: 'Video title', presence: true }
    expose :video, documentation: { type: String, desc: 'Video URL', presence: true }
    expose :author, documentation: { type: String, desc: 'Username of video author', presence: true }
    expose :created_at, documentation: { type: DateTime, desc: 'Video creation time', presence: true }

    private

    def author
      object.user.username
    end

    def video
      object.video.url || object.video.metadata['url']
    end
  end
end