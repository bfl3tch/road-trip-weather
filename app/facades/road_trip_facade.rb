class RoadTripFacade
  def self.trip(origin, destination)
    set_lat_long(destination)
    forecast = get_weather
    directions = get_directions(origin, destination)
    @travel_time = driving_time(directions)
    weather = arrival_weather(forecast)

    input_hash = {
      start_city: "#{origin}",
      end_city: "#{destination}",
      travel_time: @travel_time,
      weather_at_eta: weather
    }

    RoadTrip.new(input_hash)
  end

  def self.get_weather
    ForecastFacade.weather_getter
  end

  def self.get_directions(origin, destination)
    directions = DirectionsService.get_directions(origin, destination)[:route].without(:legs)
  end
  def self.set_lat_long(destination)
    ForecastFacade.lat_long(destination)
  end

  def self.travel_hours
    @travel_time.first.to_i
  end

  def self.third_day
    travel_hours - 48 <= 24
  end

  def self.fourth_day
    ((travel_hours - 48 > 24) && (travel_hours - 48 <= 48))
  end

  def self.fifth_day
    ((travel_hours - 48 > 48) && (travel_hours - 48 <= 72))
  end

  def self.long_trip
    @travel_time && @travel_time.length == 3 && travel_hours > 48
  end

  def self.short_trip
    @travel_time && @travel_time.length == 3 && travel_hours <= 48
  end

  def self.shorter_trip
    @travel_time && @travel_time.length == 2
  end

  def self.shortest_trip
    @travel_time && @travel_time.length == 1
  end

  def self.arrival_weather(forecast)
    if short_trip
      forecast.hourly_weather[travel_hours]
    elsif long_trip
      if third_day
        forecast.daily_weather[2]
      elsif fourth_day
        forecast.daily_weather[3]
      elsif fifth_day
        forecast.daily_weather[4]
      else
        nil
      end
    elsif shorter_trip
      forecast.hourly_weather[1]
    elsif shortest_trip
      forecast.hourly_weather[0]
      nil
    end
  end

  def self.driving_time(directions)
    if directions[:routeError][:errorCode] == (-400)
      directions[:formattedTime].split(':')
    end
  end
end
