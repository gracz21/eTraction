module API::Entities
  class Camera < Grape::Entity
    root :camera, :cameras

    expose :id, documentation: { type: Integer, presence: true }
    expose :name, documentation: { type: String, desc: 'Camera name', presence: true }
    expose :url, documentation: { type: String, desc: 'Camera url', presence: true }
  end
end