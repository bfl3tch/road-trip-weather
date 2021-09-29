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

    context 'happy path' do
      it 'creates session and logs a user in' do
        post '/api/v1/sessions', params: {
          email: "whatever@example.com",
          password: "password",
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body[:data][:attributes][:email]).to eq("whatever@example.com")
        expect(body[:data][:attributes][:api_key]).to eq(@user.api_key)
      end
    end

    context 'sad path' do
      it 'returns a generic error message about failed login with wrong password' do
        post '/api/v1/sessions', params: {
          email: "whatever@example.com",
          password: "badpass",
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body.keys).to_not include(:data)
        expect(body[:error]).to eq("Unable to log in. Please try again.")
      end

      it 'returns a generic error message about failed login with wrong email' do
        post '/api/v1/sessions', params: {
          email: "bad@example.com",
          password: "password",
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body.keys).to_not include(:data)
        expect(body[:error]).to eq("Unable to log in. Please try again.")
      end

      it 'returns a generic error message about failed login with no email' do
        post '/api/v1/sessions', params: {
          password: "password"
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body.keys).to_not include(:data)
        expect(body[:error]).to eq("Unable to log in. Please try again.")
      end
    end
  end
end
