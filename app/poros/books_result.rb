class BooksResult
  attr_reader :id, :total_books_found, :books

  def initialize(info, quantity)
    @id = nil
    @total_books_found = info[:numFound]
    @books = info[:docs].take("#{quantity}".to_i)
  end

end
