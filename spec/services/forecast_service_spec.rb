require 'rails_helper'

RSpec.describe ForecastService do
  describe 'class methods' do

    describe '::connection' do
      it 'establishes the params and connection to the mapquest geocoding api' do
        setup = ForecastService.connection

        expect(setup.params).to include('appid')
      end
    end

    describe '::get_forecast' do
      it 'gets weather for a specific location and reurns proper weather data but nothing else', :vcr do
        response = ForecastService.get_forecast('39.738453', '-104.984853')

        expect(response).to be_a(Hash)
        expect(response.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
        expect(response.keys).to_not include([:minutely])
      end
    end
  end
end
