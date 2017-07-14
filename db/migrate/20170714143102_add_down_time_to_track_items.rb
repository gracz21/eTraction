class AddDownTimeToTrackItems < ActiveRecord::Migration[5.0]
  def change
    add_column :track_items, :down_time, :integer
  end
end
