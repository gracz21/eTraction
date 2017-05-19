class RenameSequenceNumberInTrackItemsToPosition < ActiveRecord::Migration[5.0]
  def change
    rename_column :track_items, :sequence_number, :position
  end
end
