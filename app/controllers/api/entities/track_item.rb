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
      expose :arrival_time,
             documentation: { type: DateTime, desc: 'Time of arrival to this stop', presence: true }
      expose :departure_time,
             documentation: { type: Integer, desc: 'Time of departure from this stop', presence: true }

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

      def arrival_time
        Ride.last.created_at.beginning_of_minute +
            (object.travel_time + object.higher_items.pluck(:travel_time, :down_time).flatten.sum).minutes
      end

      def departure_time
        Ride.last.created_at.beginning_of_minute + (object.travel_time + object.down_time +
            object.higher_items.pluck(:travel_time, :down_time).flatten.sum).minutes
      end
    end
  end
end