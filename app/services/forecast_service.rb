class ForecastService
  def self.connection
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['weather_api_key']
    end
  end

  def self.get_forecast(lat, long)
    response = connection.get('/data/2.5/onecall') do |req|
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely'
      req.params['lat'] = "#{lat}"
      req.params['lon'] = "#{long}"
  end
  JSON.parse(response.body, symbolize_names: true)
end
end
