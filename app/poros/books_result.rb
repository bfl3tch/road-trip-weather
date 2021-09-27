class BooksResult
  attr_reader :id, :total_books_found, :books, :forecast

  def initialize(info, quantity, forecast)
    @id = nil
    @total_books_found = info[:numFound]
    @books = info[:docs].take("#{quantity}".to_i)
    @forecast = forecast
  end

end
