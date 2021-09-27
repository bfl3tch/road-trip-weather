class BooksSerializer
  include JSONAPI::Serializer

  attributes :total_books_found, :books, :forecast

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
      temperature: result.forecast[:temp],
      summary: result.forecast[:weather].first[:description]
    }
    # require "pry"; binding.pry
  end
  #   require "pry"; binding.pry
  #   # {
  #   #   temperature: forecast[:current][:temp]
  #   #   summary: forecast[:current][:weather].first[:description]
  #   # }
  # end
end
