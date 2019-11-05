class RoadTripFacade
  attr_reader :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def trip
    Trip.new(trip_data, weather_data)
  end

  def trip_data
    trip_data = GoogleDirectionsService.trip_info(origin, destination)
    GoogleDirectionsPresenter.formatted_data(trip_data)
  end

  def weather_data
    DarkskyService.get_forecast(trip_data[:lat], trip_data[:long])
    find_forecast(weather_data, trip_data)
  end

  def find_forecast(weather, routes)
    arrival = hour_arrival(trip_data[:duration])
    weather_data[:hourly][:data].find do |data|
      Time.at(data[:time]).strftime('%H') == arrival
    end
  end

  def hour_arrival(duration)
    (Time.now + ChronicDuration.parse(duration)).strftime('%H')
  end
end
