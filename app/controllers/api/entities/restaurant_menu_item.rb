module API::Entities
  class RestaurantMenuItem < Grape::Entity
    root :restaurant_menu_items, :restaurant_menu_item

    expose :id, documentation: { type: Integer, presence: true  }
    expose :name, documentation: { type: String, desc: 'Restaurant menu item name', presence: true  }
    expose :price, documentation: { type: Float, desc: 'Restaurant menu item price', presence: true  }
  end
end