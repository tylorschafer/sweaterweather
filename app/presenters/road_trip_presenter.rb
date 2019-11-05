class RoadTripPresenter
  def self.to_json(trip)
    new.serialized_json(trip)
  end

  def serialized_json(trip)
    {
      data: {
        trip_time: trip.duration ,
        trip_miles: trip.distance,
        weather_summary: trip.weather_summary
      }
    }
  end
end
