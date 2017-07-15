class AddRideIdToStatements < ActiveRecord::Migration[5.0]
  def change
    add_column :statements, :ride_id, :integer
  end
end
