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

    context 'with device identifier included in request headers' do
      context 'with valid params' do
        context 'when device is already registered' do
          let!(:user) { FactoryGirl.create(:user) }
          let!(:user_params) { { user: { username: user.username } } }
          let!(:headers) { { 'Device-Id' => user.device_id } }

          before { post '/api/v1/users', params: user_params, headers: headers }

          it { expect(response).to have_http_status(201) }

          it 'should return user record' do
            expect(response.body).to eq user_entity.represent(user).to_json
          end
        end

        context 'when device is not registered' do
          let!(:unregistered_device_id) { SecureRandom.uuid }
          let!(:user_params) { { user: { username: Faker::Name.name } } }
          let!(:headers) { { 'Device-Id' => unregistered_device_id } }

          before { post '/api/v1/users', params: user_params, headers: headers }

          it { expect(response).to have_http_status(201) }

          it 'should return newly created user record' do
            created_user = User.find_by(device_id: unregistered_device_id)
            expect(response.body).to eq user_entity.represent(created_user).to_json
          end
        end
      end

      context 'with invalid params' do
        let!(:other_user) { FactoryGirl.create(:user) }
        let!(:wrong_user_params) { { user: { username: other_user.username } } }

        before { post '/api/v1/users', params: wrong_user_params, headers: { 'Device-Id' => SecureRandom.uuid } }

        it { expect(response).to have_http_status(400) }
      end
    end

    context 'without device identifier in request headers' do
      let!(:user_params) { { user: { username: Faker::Name.name } } }
      before { post '/api/v1/users', params: user_params }

      it { expect(response).to have_http_status(401) }
    end
  end

  describe 'PUT /api/v1/users' do
    let!(:user_params) { { user: { username: Faker::Name.name } } }

    context 'with device identifier included in request headers' do
      context 'when device is already registered' do
        let!(:user) { FactoryGirl.create(:user) }
        let!(:headers) { { 'Device-Id' => user.device_id } }

        context 'with valid params' do
          before { put '/api/v1/users', params: user_params, headers: headers }

          it { expect(response).to have_http_status(200) }

          it 'should return updated user record' do
            updated_user = User.find_by(device_id: user.device_id)
            expect(response.body).to eq user_entity.represent(updated_user).to_json
          end
        end

        context 'with invalid params' do
          let!(:other_user) { FactoryGirl.create(:user) }
          let!(:wrong_user_params) { { user: { username: other_user.username } } }

          before { put '/api/v1/users', params: wrong_user_params, headers: headers }

          it { expect(response).to have_http_status(400) }
        end
      end

      context 'when device is not registered' do
        before { put '/api/v1/users', params: user_params, headers: { 'Device-Id' => SecureRandom.uuid } }

        it { expect(response).to have_http_status(401) }
      end
    end

    context 'without device identifier in request headers' do
      before { put '/api/v1/users', params: user_params }

      it { expect(response).to have_http_status(401) }
    end
  end
end