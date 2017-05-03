module API
  module Entities
    class Track < Grape::Entity
      root :tracks, :track

      expose :id, documentation: { type: Integer, presence: true }
      expose :track_items, using: API::Entities::TrackItem,
             documentation: { type: Array, desc: 'Track stops array', is_array: true, presence: true }
    end
  end
end