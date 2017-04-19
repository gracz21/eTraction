require 'rails_helper'

describe API::V1::Cameras, type: :request do
  let(:camera_entity) { API::Entities::Camera }

  describe 'GET /api/v1/movies' do
    let!(:cameras) { FactoryGirl.create_list(:camera, 3) }

    before { get '/api/v1/cameras' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all statements' do
      expect(response.body).to eq camera_entity.represent(cameras).to_json
    end
  end
end