module API
  module Entities
    class TrackItem < Grape::Entity
      root :track_items, :track_item

      expose :position,
             documentation: { type: Integer, desc: 'Stop sequence number in track', presence: true }
      expose :stop_name,
             documentation: { type: String, desc: 'Stop name', presence: true }
      expose :travel_time,
             documentation: { type: Integer, desc: 'Time needed to travel to this stop (in minutes)', presence: true }

      private

      def stop_name
        object.stop.name
      end
    end
  end
end