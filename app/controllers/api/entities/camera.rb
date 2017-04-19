module API::Entities
  class Camera < Grape::Entity
    root :camera, :cameras

    expose :id, documentation: { type: 'Integer' }
    expose :name, documentation: { type: 'String', desc: 'Camera name.' }
    expose :url, documentation: { type: 'String', desc: 'Camera url.' }
  end
end