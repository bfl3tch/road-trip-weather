require 'rails_helper'

RSpec.describe 'Authentication API', type: :request do
  describe 'POST /authentication' do
    it 'authenticates the client' do
      post '/api/v1/authentication', params: { email: 'fake@example.com', password: 'Password1' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({ 'token' => '123' })
    end

    it 'returns an error when email is missing' do
      post '/api/v1/authentication', params: { password: 'Password1' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        { 'error' => 'param is missing or the value is empty: email' })
    end

    it 'returns an error when password is missing' do
      post '/api/v1/authentication', params: { email: 'fake@example.com' }
      
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        { 'error' => 'param is missing or the value is empty: password' })
    end
  end
end
