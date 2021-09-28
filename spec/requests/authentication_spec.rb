require 'rails_helper'

RSpec.describe 'Authentication API', type: :request do
  describe 'POST /authentication' do
    let(:user) { FactoryBot.create(:user, email: 'fake@example.com', password: 'Password1') }

    it 'authenticates the client' do
      post '/api/v1/authentication', params: { email: user.email, password: 'Password1' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'token' => "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZmFrZUBleGFtcGxlLmNvbSJ9.aLkoUuAAOJxXfow-eZwRfUw81SdLQAYd41F-_awfnNQ" })
    end

    it 'returns an error when email is missing' do
      post '/api/v1/authentication', params: { password: 'Password1' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        { 'error' => 'param is missing or the value is empty: email' })
    end

    it 'returns an error when password is missing' do
      post '/api/v1/authentication', params: { email: user.email }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq(
        { 'error' => 'param is missing or the value is empty: password' })
    end

    it 'returns an error when password is incorrect' do
      post '/api/v1/authentication', params: { email: user.email, password: 'incorrect' }

      expect(response).to have_http_status(:unauthorized)
    end

  end
end
