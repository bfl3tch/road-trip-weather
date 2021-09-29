class RoadTripSerializer
  include JSONAPI::Serializer
  attributes :start_city, :end_city, :travel_time, :weather_at_eta

  attribute :weather_at_eta do |weather|
    if !weather.weather_at_eta.nil? && weather.weather_at_eta[:temp].class == (Float || Integer)
      {
        temperature: weather.weather_at_eta[:temp],
        conditions: weather.weather_at_eta[:weather].first[:description]
      }
    elsif !weather.weather_at_eta.nil? && weather.weather_at_eta[:temp].class == Hash
      {
        temperature: weather.weather_at_eta[:temp][:day],
        conditions: weather.weather_at_eta[:weather].first[:description]
      }
    else
      {}
    end
  end

  attribute :travel_time do |travel|
    if travel.travel_time.length > 0
      time = JSON.parse(travel.travel_time)
        "#{time.first} hours, #{time.second} minutes"
    else
      "impossible route"
    end
  end
end
