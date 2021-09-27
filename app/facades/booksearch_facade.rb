class BooksearchFacade
  def self.get_books(query, quantity)
    response = BookService.get_books(query, quantity)
    lat_long = LatLongService.get_lat_long(query)

    lat = lat_long[:results].first[:locations].first[:latLng][:lat]
    long = lat_long[:results].first[:locations].first[:latLng][:lng]
    destination = "#{query}"
    weather = ForecastService.get_forecast(lat, long)
    forecast = weather[:current]
    BooksResult.new(response, quantity, forecast, destination)
  end
end
