require 'rails_helper'

RSpec.describe Forecast do
  before(:each) do
    @hash = JSON.parse(File.read('./spec/fixtures/test_data/forecast_hash.rb'), symbolize_names: true)

  end
  describe 'instantiation' do
    it 'creates a forecast object' do
      expect(@hash).to be_an_instance_of(Hash)
      expect(@hash.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])

      expect(Forecast.new(@hash)).to be_an_instance_of(Forecast)
    end
  end

  describe 'attributes' do
    it 'has proper forecast attributes' do
      @forecast = Forecast.new(@hash)

      expect(@forecast.current_weather.keys).to include(:weather)
      expect(@forecast.daily_weather.first.keys).to include(:weather)
    end
  end
end
