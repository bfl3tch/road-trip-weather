require 'rails_helper'

RSpec.describe 'Users Registration API', type: :request do
  describe 'create action' do
    context 'happy path' do
      xit 'creates a user and generates a unique API key for that user', :vcr do
        user_params = {
          "email": "example@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        post "/api/v1/users", params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(201)

        json = JSON.parse(response.body, symbolize_names: true)
        user = json[:data]

        expect(user[:type]).to eq('users')
        expect(user).to have_key(:id)
        expect(user[:id]).to_not(be_empty)
        expect(user[:attributes].keys.count).to eq(2)
        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to_not(be_empty)
        expect(user[:attributes]).to have_key(:api_key)
        expect(user[:attributes][:api_key]).to_not(be_empty)
      end
    end
  end
end
