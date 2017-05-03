require 'rails_helper'

describe API::V1::Messages, type: :request do
  let(:message_entity) { API::Entities::Message }
  let!(:user) { FactoryGirl.create(:user) }

  describe 'GET /api/v1/messages' do
    let!(:messages) { FactoryGirl.create_list(:message, 3, user: user) }

    before { get '/api/v1/messages' }

    it { expect(response).to have_http_status(200) }

    it 'should return all messages' do
      expect(response.body).to eq message_entity.represent(messages).to_json
    end
  end

  describe 'POST /api/v1/messages' do
    let!(:message_params) { { message: FactoryGirl.attributes_for(:message) } }

    context 'when device identifier is included in request headers' do
      let(:headers) { { 'Device-Id' => device_id } }

      context 'when device is already registered' do
        let!(:device_id) { user.device_id }

        context 'when params are valid' do
          before { post '/api/v1/messages', params: message_params, headers: headers }

          it { expect(response).to have_http_status(201) }

          it 'returns created message' do
            created_message = Message.order(created_at: :desc).first
            expect(response.body).to eq message_entity.represent(created_message).to_json
          end
        end

        context 'when params are invalid' do
          let!(:wrong_message_params) { { message: { text: Faker::Lorem.characters(141) } } }

          before { post '/api/v1/messages', params: wrong_message_params, headers: headers }

          it { expect(response).to have_http_status(400) }
        end

        context 'when params are missing' do
          before { post '/api/v1/messages', headers: headers }

          it { expect(response).to have_http_status(400) }
        end
      end

      context 'when device is not registered' do
        let!(:device_id) { SecureRandom.uuid }

        before { post '/api/v1/messages', params: message_params, headers: headers }

        it { expect(response).to have_http_status(401) }
      end
    end

    context 'when device identifier is not included in request headers' do
      before { post '/api/v1/messages', params: message_params }

      it { expect(response).to have_http_status(401) }
    end
  end
end