require 'rails_helper'

describe API::V1::Movies, type: :request do
  let(:movie_entity) { API::Entities::Movie }

  describe 'GET /api/v1/movies' do
    let!(:movies) { FactoryGirl.create_list(:movie, 3) }

    before { get '/api/v1/movies' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all movies' do
      expect(response.body).to eq movie_entity.represent(movies).to_json
    end
  end
end