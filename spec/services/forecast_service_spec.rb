require 'rails_helper'

RSpec.describe ForecastService do
  describe 'class methods' do
    describe '::get_forecast' do
      context 'happy path' do
        it 'gets weather for a specific location', :vcr do
          response = ForecastService.get_forecast('39.738453', '-104.984853')
          expect(response).to be_a(Hash)
          expect(response.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
          expect(response.keys).to_not include([:minutely])
        end
      end
    end
  end
end
