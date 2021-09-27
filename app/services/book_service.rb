class BookService
  def self.connection
    Faraday.new(url: 'http://openlibrary.org')
  end

  def self.get_books(subject)
    response = connection.get('/search.json') do |req|
      req.params['q'] = "#{subject}"
  end
  JSON.parse(response.body, symbolize_names: true)
end
end
