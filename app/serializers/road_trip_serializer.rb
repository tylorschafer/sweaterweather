class RoadTripSerializer
  def self.create(trip)
    new.render_json_response(trip)
  end

  def render_json_response(trip)
    {
      data: {
        trip_time: trip.duration ,
        trip_miles: trip.distance,
        weather_summary: trip.weather_summary
      }
    }
  end
end
