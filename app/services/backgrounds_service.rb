class BackgroundsService
  def self.connection
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.headers['Authorization'] = ENV['photo_api_key']
    end
  end

  def self.get_backgrounds(location)
    response = connection.get("/search/photos") do |req|
      req.params['query'] = "#{location}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
