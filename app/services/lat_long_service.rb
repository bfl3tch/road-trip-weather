class LatLongService
  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/') do |faraday|
      faraday.params['key'] = ENV['mapquest_api_key']
    end
  end

  def self.get_lat_long(city_state)
    JSON.parse(
    connection.get("address?location=#{city_state}").body,
    symbolize_names: true)
  end
end
