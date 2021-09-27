class BooksResult
  attr_reader :id, :total_books_found, :books, :forecast, :destination

  def initialize(info, quantity, forecast, destination)
    @id = nil
    @total_books_found = info[:numFound]
    @books = info[:docs].take("#{quantity}".to_i)
    @forecast = forecast
    @destination = destination
  end

end
