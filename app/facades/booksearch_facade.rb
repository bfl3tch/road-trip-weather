class BooksearchFacade
  def self.get_books(query, quantity)
    response = BookService.get_books(query, quantity)

    BooksResult.new(response, quantity)
  end
end
