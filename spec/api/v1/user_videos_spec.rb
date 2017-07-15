require 'rails_helper'

describe API::V1::UserVideos, type: :request do
  let(:user_video_entity) { API::Entities::UserVideo }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    stops = FactoryGirl.create_list(:stop, 3)
    track_items = []
    stops.each_with_index do |stop, i|
      track_items << FactoryGirl.create(:track_item, position: i + 1, stop: stop)
    end
    track = nil
    TrackItem.acts_as_list_no_update do
      track = FactoryGirl.create(:track, track_items: track_items)
    end
    FactoryGirl.create(:ride, track: track)
  end

  describe 'GET /api/v1/user_videos' do
    let!(:user_videos) { FactoryGirl.create_list(:user_video, 3, user: user) }

    before { get '/api/v1/user_videos' }

    it { expect(response).to have_http_status(200) }

    it 'returns all movies' do
      expect(response.body).to eq user_video_entity.represent(user_videos).to_json
    end
  end
end