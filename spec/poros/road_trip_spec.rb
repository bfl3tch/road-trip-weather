require 'rails_helper'

RSpec.describe RoadTrip do
    let(:hash) {{
              start_city: "Kennebunk, ME",
              end_city: "Kennebunkport, ME",
              travel_time: ["00", "08", "00"],
              weather_at_eta:
                {
                  dt: 1632898800,
                  temp: 52.29,
                  feels_like: 50.41,
                  pressure: 1010,
                  humidity: 68,
                  dew_point: 42.06,
                  uvi: 0,
                  clouds: 100,
                  visibility: 10000,
                  wind_speed: 9.55,
                  wind_deg: 4,
                  wind_gust: 19.22,
                  weather: [
                  {
                    id: 804, main: "Clouds", description: "overcast clouds", icon: "04n"
                  }],
                  pop: 0
                }
            }}
    let(:new_object) { described_class.new(hash) }

  describe 'instantiation' do
    it 'creates a roadtrip object' do
      expect(new_object).to be_an_instance_of(RoadTrip)
    end
  end

  describe 'attributes' do
    it 'has an end city, start city, travel time in hours mins seconds, and weather at eta' do
      expect(new_object.end_city).to eq('Kennebunkport, ME')
      expect(new_object.start_city).to eq('Kennebunk, ME')
      expect(new_object.travel_time).to eq("[\"00\", \"08\", \"00\"]")
      expect(new_object.weather_at_eta.keys).to include(:temp)
      expect(new_object.weather_at_eta.keys).to include(:weather)
      expect(new_object.weather_at_eta[:weather].first.keys).to eq([:id, :main, :description, :icon])
    end
  end
end
