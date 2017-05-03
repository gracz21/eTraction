require 'rails_helper'

describe API::V1::RestaurantMenuItems, type: :request do
  let(:restaurant_menu_item_entity) { API::Entities::RestaurantMenuItem }

  describe 'GET /api/v1/restaurant_menu_item' do
    let!(:restaurant_menu_items) { FactoryGirl.create_list(:restaurant_menu_item, 3) }

    before { get '/api/v1/restaurant_menu_items' }

    it { expect(response).to have_http_status(200) }

    it 'should return all restaurant menu items' do
      expect(response.body).to eq restaurant_menu_item_entity.represent(restaurant_menu_items).to_json
    end
  end
end