module API::V1
  class RestaurantMenuItems < Grape::API
    resource :restaurant_menu_items do
      desc 'Return all restaurant menu items',
           entity: API::Entities::RestaurantMenuItem
      get do
        present RestaurantMenuItem.all, with: API::Entities::RestaurantMenuItem
      end
    end
  end
end