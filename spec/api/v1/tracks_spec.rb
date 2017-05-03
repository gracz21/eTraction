require 'rails_helper'

describe API::V1::Track, type: :request do
  let(:track_entity) { API::Entities::Track }

  describe 'GET /api/v1/tracks' do
    let!(:track) do
      stops = FactoryGirl.create_list(:stop, 3)
      track = FactoryGirl.create(:track)
      stops.each_with_index do |stop, i|
        FactoryGirl.create(:track_item, sequence_number: i+1, stop: stop, track: track)
      end
      track
    end

    before do
      FactoryGirl.create(:ride, track: track)
      get '/api/v1/tracks'
    end

    it { expect(response).to have_http_status(200) }

    it 'should return current ride track' do
      expect(response.body).to eq track_entity.represent(track).to_json
    end
  end
end