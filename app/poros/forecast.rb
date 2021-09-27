class Forecast
  attr_reader :id,
              :lat,
              :long,
              :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(forecast)
    @id = nil
    @lat = forecast[:lat]
    @long = forecast[:lon]
    @current_weather = forecast[:current]
    @hourly_weather = forecast[:hourly]
    @daily_weather = forecast[:daily]
  end
end
