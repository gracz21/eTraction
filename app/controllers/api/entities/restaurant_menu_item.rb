module API::Entities
  class RestaurantMenuItem < Grape::Entity
    root :restaurant_menu_items, :restaurant_menu_item

    expose :id, documentation: { type: 'Integer' }
    expose :name, documentation: { type: 'String', desc: 'Restaurant menu item name' }
    expose :price, documentation: { type: 'Float', desc: 'Restaurant menu item price' }
  end
end