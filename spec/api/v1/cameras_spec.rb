require 'rails_helper'

describe API::V1::Cameras, type: :request do
  let(:camera_entity) { API::Entities::Camera }

  describe 'GET /api/v1/cameras' do
    let!(:cameras) { FactoryGirl.create_list(:camera, 3) }

    before { get '/api/v1/cameras' }

    it { expect(response).to have_http_status(200) }

    it 'should return all cameras' do
      expect(response.body).to eq camera_entity.represent(cameras).to_json
    end
  end
end