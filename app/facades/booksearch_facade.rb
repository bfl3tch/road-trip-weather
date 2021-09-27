class BooksearchFacade
  def self.get_books(query, quantity)
    response = BookService.get_books(query, quantity)
    lat_long = LatLongService.get_lat_long(query)
    forecast = ForecastService.get_forecast
    BooksResult.new(response, quantity, forecast)
  end
end
