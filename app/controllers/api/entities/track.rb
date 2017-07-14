module API
  module Entities
    class Track < Grape::Entity
      root :tracks, :track

      expose :id,
             documentation: { type: Integer, presence: true }
      expose :total_travel_time,
             documentation: { type: Integer, desc: 'Estimated total track time (in minutes)', presence: true }
      expose :track_items, using: API::Entities::TrackItem,
             documentation: { type: Array, desc: 'Track stops array', is_array: true, presence: true }

      private

      def total_travel_time
        object.track_items.pluck(:travel_time, :down_time).flatten.sum
      end
    end
  end
end