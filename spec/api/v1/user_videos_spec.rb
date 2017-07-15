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

  describe 'POST /api/v1/user_videos' do
    let!(:user_video_params) { { user_video: FactoryGirl.attributes_for(:user_video) } }

    context 'when device identifier is included in request headers' do
      let(:headers) { { 'Device-Id' => device_id } }

      context 'when device is already registered' do
        let!(:device_id) { user.device_id }

        context 'when params are valid' do
          before { post '/api/v1/user_videos', params: user_video_params, headers: headers }

          it { expect(response).to have_http_status(201) }

          it 'returns created message' do
            created_user_video = UserVideo.order(created_at: :desc).first
            expect(response.body).to eq user_video_entity.represent(created_user_video).to_json
          end
        end

        context 'when params are invalid' do
          let!(:wrong_user_video_params) {
            { user_video:FactoryGirl.attributes_for(:user_video, title: Faker::Lorem.characters(51)) } }

          before { post '/api/v1/user_videos', params: wrong_user_video_params, headers: headers }

          it { expect(response).to have_http_status(400) }
        end

        context 'when params are missing' do
          before { post '/api/v1/user_videos', headers: headers }

          it { expect(response).to have_http_status(400) }
        end
      end

      context 'when device is not registered' do
        let!(:device_id) { SecureRandom.uuid }

        before { post '/api/v1/user_videos', params: user_video_params, headers: headers }

        it { expect(response).to have_http_status(401) }
      end
    end

    context 'when device identifier is not included in request headers' do
      before { post '/api/v1/user_videos', params: user_video_params }

      it { expect(response).to have_http_status(401) }
    end
  end

  describe 'DELETE /api/v1/user_videos' do

  end
end