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
      it 'returns road trip info for a route to nowhere', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Kennebunk, ME',
          destination: 'Kennebunk, ME',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

      it 'returns road trip info for a route under 1 hour', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Kennebunk, ME',
          destination: 'Kennebunkport, ME',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

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

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

      it 'returns road trip info and weather for a route between 2 - 3 days', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Vancouver, CA',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

      it 'returns road trip info and weather for a route between 3 - 4 days', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Fairbanks, AK',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

      it 'returns road trip info and weather for a route between 4 - 5 days', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Fort Ware, BC',
          destination: 'Panama',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(body[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      end

      it 'returns road trip info but no weather for a route over 5 days', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Fairbanks, AK',
          destination: 'Panama',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(body[:data][:type]).to eq('road_trip')
        expect(body[:data]).to have_key(:attributes)

        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:weather_at_eta]).to eq({})
      end

      it 'returns a valid object saying impossible route if impossible', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'London, UK',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(body[:data][:attributes].keys.count).to eq(4)
        expect(body[:data][:attributes]).to have_key(:end_city)
        expect(body[:data][:attributes]).to have_key(:start_city)
        expect(body[:data][:attributes]).to have_key(:travel_time)
        expect(body[:data][:attributes]).to have_key(:weather_at_eta)
        expect(body[:data][:attributes][:travel_time]).to eq('impossible route')
      end
    end

    context 'sad path' do
      it 'returns error message for invalid API key if invalid', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Kennebunk, ME',
          api_key: 'BadAPIkey'
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(401)
        expect(body[:error]).to eq("Invalid API key")
      end

      it 'returns error message for invalid API key if missing entirely', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          destination: 'Kennebunk, ME',
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(401)
        expect(body[:error]).to eq("Invalid API key")
      end

      it 'returns error message for destination missing if it is', :vcr do
        post '/api/v1/road_trip', params: {
          origin: 'Marco Island, FL',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(body[:error]).to eq("Must have both origin and destination query params")
      end

      it 'returns error message for origin missing if it is', :vcr do
        post '/api/v1/road_trip', params: {
          destination: 'Marco Island, FL',
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(body[:error]).to eq("Must have both origin and destination query params")
      end

      it 'returns error message for origin and destination missing if they are', :vcr do
        post '/api/v1/road_trip', params: {
          api_key: @user_data[:data][:attributes][:api_key]
        }

        body = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(body[:error]).to eq("Must have both origin and destination query params")
      end
    end
  end
end
