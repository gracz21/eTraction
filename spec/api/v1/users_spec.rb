require 'rails_helper'

describe API::V1::Users, type: :request do
  let(:user_entity) { API::Entities::User }

  describe 'GET /api/v1/users' do
    let!(:user) { FactoryGirl.create(:user) }

    context 'when device identifier is included in request headers' do
      context 'when device with given id is already registered' do
        let!(:headers) { { 'Device-Id' => user.device_id } }

        before { get '/api/v1/users', headers: headers }

        it { expect(response).to have_http_status(200) }

        it 'should return user record connected to given device id' do
          expect(response.body).to eq user_entity.represent(user).to_json
        end
      end

      context 'when device with given id is not registered' do
        let!(:headers) { { 'Device-Id' => SecureRandom.uuid } }

        before { get '/api/v1/users', headers: headers }

        it { expect(response).to have_http_status(404) }
      end
    end

    context 'when device identifier is included in request headers' do
      before { get '/api/v1/users' }

      it { expect(response).to have_http_status(401) }
    end
  end

  describe 'POST /api/v1/users' do
    let!(:user_params) { { user: { username: Faker::Name.name } } }

    context 'when device identifier is included in request headers' do
      let(:headers) { { 'Device-Id' => device_id } }

      context 'when device with given id is not registered' do
        let!(:device_id) { SecureRandom.uuid }

        context 'when params are valid' do
          before { post '/api/v1/users', params: user_params, headers: headers }

          it { expect(response).to have_http_status(201) }

          it 'should return newly created user record' do
            created_user = User.find_by(device_id: device_id)
            expect(response.body).to eq user_entity.represent(created_user).to_json
          end
        end

        context 'when params are invalid' do
          let!(:other_user) { FactoryGirl.create(:user) }
          let!(:wrong_user_params) { { user: { username: other_user.username } } }

          before { post '/api/v1/users', params: wrong_user_params, headers: headers }

          it { expect(response).to have_http_status(400) }
        end
      end

      context 'when device with given id is already registered' do
        let!(:other_user) { FactoryGirl.create(:user) }
        let!(:device_id) { other_user.device_id }

        before { post '/api/v1/users', params: user_params, headers: headers }

        it { expect(response).to have_http_status(400) }
      end
    end

    context 'when device identifier is nor included in request headers' do
      before { post '/api/v1/users', params: user_params }

      it { expect(response).to have_http_status(401) }
    end
  end

  describe 'PUT /api/v1/users' do
    let!(:user_params) { { user: { username: Faker::Name.name } } }

    context 'when device identifier is included in request headers' do
      let(:headers) { { 'Device-Id' => device_id } }

      context 'when device with given id is registered' do
        let!(:user) { FactoryGirl.create(:user) }
        let!(:device_id) { user.device_id }

        context 'when params are valid' do
          before { put '/api/v1/users', params: user_params, headers: headers }

          it { expect(response).to have_http_status(200) }

          it 'should return updated user record' do
            updated_user = User.find_by(device_id: user.device_id)
            expect(response.body).to eq user_entity.represent(updated_user).to_json
          end
        end

        context 'when params are invalid' do
          let!(:other_user) { FactoryGirl.create(:user) }
          let!(:wrong_user_params) { { user: { username: other_user.username } } }

          before { put '/api/v1/users', params: wrong_user_params, headers: headers }

          it { expect(response).to have_http_status(400) }
        end
      end

      context 'when device with given id is not registered' do
        let!(:device_id) { SecureRandom.uuid }

        before { put '/api/v1/users', params: user_params, headers: headers }

        it { expect(response).to have_http_status(401) }
      end
    end

    context 'when device identifier is not included in request headers' do
      before { put '/api/v1/users', params: user_params }

      it { expect(response).to have_http_status(401) }
    end
  end
end