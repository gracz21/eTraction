class AddIndexOnTrackIdAndStopIdToTrackItems < ActiveRecord::Migration[5.0]
  def change
    add_index :track_items, [:track_id, :stop_id], unique: true
  end
end
