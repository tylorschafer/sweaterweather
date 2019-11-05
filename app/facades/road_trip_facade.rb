class RoadTripFacade
  attr_reader :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def trip
    routes = GoogleDirections.trip_info(origin, destination)
    weather = Darksky.new(routes[:lat], routes[:long]).json_response
    binding.pry
  end

end
