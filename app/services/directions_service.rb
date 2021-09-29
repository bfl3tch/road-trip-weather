class DirectionsService
  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.get_directions(origin, destination)
    response = connection.get("/directions/v2/route") do |req|
      req.params['from'] = "#{origin}"
      req.params['to'] = "#{destination}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
