require 'rails_helper'

describe API::V1::Statements, type: :request do
  let(:statement_entity) { API::Entities::Statement }

  describe 'GET /api/v1/statements' do
    let!(:statements) { FactoryGirl.create_list(:statement, 3) }

    before { get '/api/v1/statements' }

    it { expect(response).to have_http_status(200) }

    it 'should return all statements' do
      expect(response.body).to eq statement_entity.represent(statements).to_json
    end
  end
end