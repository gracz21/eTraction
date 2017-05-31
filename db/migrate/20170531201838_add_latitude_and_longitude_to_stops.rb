class AddLatitudeAndLongitudeToStops < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :latitude, :float
    add_column :stops, :longitude, :float
  end
end
