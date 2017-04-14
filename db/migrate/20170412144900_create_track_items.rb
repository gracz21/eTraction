class CreateTrackItems < ActiveRecord::Migration[5.0]
  def change
    create_table :track_items do |t|
      t.belongs_to :stop, indexed: true
      t.belongs_to :track, indexed: true
      t.integer :sequence_number
      t.integer :travel_time

      t.timestamps
    end
  end
end
