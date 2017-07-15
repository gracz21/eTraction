class AddRideIdToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :ride_id, :integer
  end
end
