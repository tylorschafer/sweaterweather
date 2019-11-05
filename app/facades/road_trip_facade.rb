class RoadTripFacade
  attr_reader :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def trip
    trip_data = GoogleDirectionsService.trip_info(origin, destination)
    formatted_trip = GoogleDirectionsPresenter.formatted_data(trip_data)
    weather = DarkskyService.get_forecast(formatted_trip[:lat], formatted_trip[:long])
    forecast = find_forecast(weather, formatted_trip)
    Trip.new(formatted_trip, forecast)
  end

  def find_forecast(weather, routes)
    arrival = hour_arrival(routes[:duration])
    weather[:hourly][:data].find do |data|
      Time.at(data[:time]).strftime('%H') == arrival
    end
  end

  def hour_arrival(duration)
    (Time.now + ChronicDuration.parse(duration)).strftime('%H')
  end
end
