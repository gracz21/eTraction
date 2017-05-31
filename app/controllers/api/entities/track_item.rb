module API
  module Entities
    class TrackItem < Grape::Entity
      root :track_items, :track_item

      expose :position,
             documentation: { type: Integer, desc: 'Stop sequence number in track', presence: true }
      expose :stop_name,
             documentation: { type: String, desc: 'Stop name', presence: true }
      expose :stop_lat, as: :lat,
             documentation: { type: Float, desc: 'Stop latitude', presence: true }
      expose :stop_lon, as: :lon,
             documentation: { type: Float, desc: 'Stop longitude', presence: true }
      expose :travel_time,
             documentation: { type: Integer, desc: 'Time needed to travel to this stop (in minutes)', presence: true }

      private

      def stop_name
        object.stop.name
      end

      def stop_lat
        object.stop.latitude
      end

      def stop_lon
        object.stop.longitude
      end
    end
  end
end