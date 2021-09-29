require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'create action' do
    before(:each) do
      @email = 'whatever@example.com'
      @password = 'password'
      @not_password = 'badpassword'
    end

    context 'with valid parameters' do
      it 'returns the users email and an api key', :vcr do
        post '/api/v1/users', params: { email: @email, password: @password, password_confirmation: @password }
        result = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(201)
        expect(result[:data].keys).to eq([:id, :type, :attributes])
        expect(result[:data][:attributes].keys).to eq([:email, :api_key])
        expect(result[:data][:attributes][:api_key]).to_not eq(nil)
        expect(result[:data][:attributes][:api_key].size).to eq(32)
      end
    end

    context 'with invalid parameters' do
      it "returns an error for mismatched passwords and password confirmations", :vcr do
        post "/api/v1/users", params: { email: @email, password: @password, password_confirmation: @not_password }

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(result.keys).to_not include(:data)
        expect(result[:error]).to eq("Password confirmation doesn't match Password.")
      end

      it "returns an error for a reused email addresses", :vcr do
        post "/api/v1/users", params: { email: @email, password: @password, password_confirmation: @password }
        expect(response.status).to eq(201)

        post "/api/v1/users", params: { email: @email, password: @password, password_confirmation: @password }

        result = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(result.keys).to_not include(:data)
        expect(result[:error]).to eq("Email has already been taken.")
      end

      it 'returns an error for a blank password field', :vcr do
        post "/api/v1/users", params: { email: @email, password_confirmation: @password }

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result.keys).to_not include(:data)
        expect(result[:error]).to eq("Password can't be blank.")
      end

      it 'returns an error for a blank password_confirmation field', :vcr do
        post "/api/v1/users", params: { email: @email, password: @password }

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result.keys).to_not include(:data)
        expect(response.status).to eq(422)
        expect(result[:error]).to eq("Password confirmation can't be blank.")
      end

      it 'returns an error for a blank email field', :vcr do
        post "/api/v1/users", params: { password: @password, password_confirmation: @password }

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result.keys).to_not include(:data)
        expect(response.status).to eq(422)
        expect(result[:error]).to eq("Email can't be blank.")
      end

      it 'returns an error for an incorrectly formatted email', :vcr do
        post "/api/v1/users", params: { email: 'bad', password: @password, password_confirmation: @password }

        result = JSON.parse(response.body, symbolize_names: true)

        expect(result.keys).to_not include(:data)
        expect(response.status).to eq(422)
        expect(result[:error]).to eq("Email is invalid.")
      end
    end
  end
end
