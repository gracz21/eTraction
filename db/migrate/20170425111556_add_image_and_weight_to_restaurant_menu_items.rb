class AddImageAndWeightToRestaurantMenuItems < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurant_menu_items, :image, :string
    add_column :restaurant_menu_items, :weight, :float
  end
end
