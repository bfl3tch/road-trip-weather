class BooksSerializer
  include JSONAPI::Serializer

  attributes :destination, :forecast, :total_books_found, :books

  attribute :books do |results|
    results.books.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end

  attribute :forecast do |result|
    {
      summary: result.forecast[:weather].first[:description],
      temperature: "#{result.forecast[:temp].to_i.round(1)} F"
    }
  end
end
