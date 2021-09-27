class ForecastFacade
  def self.weather_getter
    result = ForecastService.get_forecast(@@lat, @@long)
    Forecast.new(result)
  end

  def self.lat_long(location)
    response = LatLongService.get_lat_long(location)
    @@lat = response[:results].first[:locations].first[:latLng][:lat].to_s
    @@long = response[:results].first[:locations].first[:latLng][:lng].to_s
  end
end
