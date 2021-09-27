class BooksearchFacade
  def self.get_books(query, quantity)
    response = BookService.get_books(query, quantity)

    BookResult.new(response)
  end
end
