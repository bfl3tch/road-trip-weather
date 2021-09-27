class BookSerializer
  include JSONAPI::Serializer

  # attributes :current_weather, :daily_weather, :hourly_weather
  #
  # attribute :current_weather do |forecast|
  #   forecast.current_weather[:datetime] = Time.at(forecast.current_weather[:dt]).to_datetime
  #   forecast.current_weather[:temperature] = forecast.current_weather[:temp]
  #   forecast.current_weather[:sunrise] = Time.at(forecast.current_weather[:sunrise]).to_datetime
  #   forecast.current_weather[:sunset] = Time.at(forecast.current_weather[:sunset]).to_datetime
  #   forecast.current_weather[:conditions] = forecast.current_weather[:weather].first[:description]
  #   forecast.current_weather[:icon] = forecast.current_weather[:weather].first[:icon]
  #   forecast.current_weather.without(:pressure, :dew_point, :clouds, :wind_speed, :wind_deg, :wind_gust, :weather, :dt, :temp)
  # end
  #
  # attribute :daily_weather do |forecast|
  #   forecast.daily_weather.take(5).map do |daily_forecast|
  #     {
  #       date: Time.at(daily_forecast[:dt]).to_date,
  #       sunrise: Time.at(daily_forecast[:sunrise]).to_datetime,
  #       sunset: Time.at(daily_forecast[:sunset]).to_datetime,
  #       max_temp: daily_forecast[:temp][:max],
  #       min_temp: daily_forecast[:temp][:min],
  #       conditions: daily_forecast[:weather].first[:description],
  #       icon: daily_forecast[:weather].first[:icon],
  #     }
  #   end
  # end
  #
  # attribute :hourly_weather do |forecast|
  #   forecast.hourly_weather.take(8).map do |hourly_forecast|
  #     {
  #       time: Time.at(hourly_forecast[:dt]).strftime("%H:%M:%S"),
  #       temperature: hourly_forecast[:temp],
  #       conditions: hourly_forecast[:weather].first[:description],
  #       icon: hourly_forecast[:weather].first[:icon],
  #     }
  #   end
  # end
end
