class AddAddressToStops < ActiveRecord::Migration[5.0]
  def change
    add_column :stops, :address, :string
  end
end
