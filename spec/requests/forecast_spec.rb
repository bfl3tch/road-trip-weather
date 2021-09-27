require 'rails_helper'

RSpec.describe 'Forecast API' do
  describe 'index action' do
    context 'happy path' do
      before(:each) do
        get '/api/v1/forecast?location=denver,co'
        @results_hash = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns the forecast data for a specific location', :vcr do
        expect(response.status).to eq 200
        expect(@results_hash[:data][:type]).to eq('forecast')
      end

      it 'has all the required data', :vcr do
        expect(@results_hash[:data][:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])

        expect(@results_hash[:data][:attributes][:current_weather]).to include(:datetime)
        expect(@results_hash[:data][:attributes][:current_weather]).to include(:temperature)
        expect(@results_hash[:data][:attributes][:current_weather]).to include(:sunrise)
        expect(@results_hash[:data][:attributes][:current_weather]).to include(:sunset)
        expect(@results_hash[:data][:attributes][:current_weather]).to include(:icon)
        expect(@results_hash[:data][:attributes][:current_weather]).to include(:conditions)

        expect(@results_hash[:data][:attributes][:daily_weather].first).to include(:date)
        expect(@results_hash[:data][:attributes][:daily_weather].first).to include(:max_temp)
        expect(@results_hash[:data][:attributes][:daily_weather].first).to include(:conditions)
        expect(@results_hash[:data][:attributes][:daily_weather].first).to include(:icon)

        expect(@results_hash[:data][:attributes][:hourly_weather].first).to include(:time)
        expect(@results_hash[:data][:attributes][:hourly_weather].first).to include(:temperature)
        expect(@results_hash[:data][:attributes][:hourly_weather].first).to include(:conditions)
        expect(@results_hash[:data][:attributes][:hourly_weather].first).to include(:icon)

      end

      it 'has none of the unnecessary data or incorrect key names', :vcr do
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:pressure)
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:dew_point)
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:clouds)
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:wind_gust)
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:wind_speed)
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:dt)
        expect(@results_hash[:data][:attributes][:current_weather]).to_not include(:weather)

        expect(@results_hash[:data][:attributes][:daily_weather].first).to_not include(:dt)
        expect(@results_hash[:data][:attributes][:daily_weather].first).to_not include(:weather)
        expect(@results_hash[:data][:attributes][:daily_weather].first).to_not include(:wind_deg)
        expect(@results_hash[:data][:attributes][:daily_weather].first).to_not include(:pop)

        expect(@results_hash[:data][:attributes][:hourly_weather].first).to_not include(:humidity)
        expect(@results_hash[:data][:attributes][:hourly_weather].first).to_not include(:visibility)
        expect(@results_hash[:data][:attributes][:hourly_weather].first).to_not include(:clouds)
        expect(@results_hash[:data][:attributes][:hourly_weather].first).to_not include(:wind_gust)
      end
    end
  end
end
