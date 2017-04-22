require 'rails_helper'

describe API::V1::Messages, type: :request do
  let(:message_entity) { API::Entities::Message }

  describe 'GET /api/v1/messages' do
    let!(:messages) { FactoryGirl.create_list(:message, 3) }

    before { get '/api/v1/messages' }

    it { expect(response).to have_http_status(200) }

    it 'returns all messages' do
      expect(response.body).to eq message_entity.represent(messages).to_json
    end
  end

  describe 'POST /api/v1/messages' do
    context 'with valid params' do
      let!(:message_params) { { message: FactoryGirl.attributes_for(:message) } }

      before { post '/api/v1/messages', params: message_params }

      it { expect(response).to have_http_status(201) }

      it 'returns created message' do
        created_message = Message.order(created_at: :desc).first
        expect(response.body).to eq message_entity.represent(created_message).to_json
      end
    end

    context 'with invalid params' do
      let!(:message_params) { { message: { text: Faker::Lorem.characters(141) } } }

      before { post '/api/v1/messages', params: message_params }

      it { expect(response).to have_http_status(400) }
    end
  end
end