require 'rails_helper'

RSpec.describe "Sessions API" do
  describe 'Sessions Post' do
    before(:each) do
      post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      body = JSON.parse(response.body, symbolize_names: true)

      @user = User.find(body[:data][:id].to_i)
    end

    it 'happy path: creates session and logs a user in' do
      post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:data][:attributes][:email]).to eq("ligma1@example.com")
      expect(body[:data][:attributes][:api_key]).to eq(@user.api_key)
    end
  end
end
