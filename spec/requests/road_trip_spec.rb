require 'rails_helper'

RSpec.describe 'Roadtrip API' do
  describe 'Roadtrip Post' do
    before(:each) do
      post '/api/v1/users', params: {
        email: 'whatever@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      @user_data = JSON.parse(response.body, symbolize_names: true)
    end

    context 'happy path' do
      it 'returns road trip info for a route under 48 hours', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Kennebunk, ME',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

      it 'returns road trip info for a route under 5 days', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Ketchikan, AK',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end
    end

    context 'sad path' do
      it 'returns error message for invalid API key', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Kennebunk, ME',
          api_key: 'BadAPIkey'
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(401)
        expect(body[:error]).to eq("Invalid API key")
      end

      it 'returns a valid object saying impossible route if impossible', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'London, UK',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(201)


      end
    end
  end
end
