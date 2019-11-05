class GoogleDirectionsPresenter

  def self.formatted_data(trip_data)
    new.format_trip(trip_data)
  end

  def format_trip(trip_data)
    trip = Hash.new
    trip[:distance] = trip_data[:routes][0][:legs][0][:distance][:text]
    trip[:duration] = trip_data[:routes][0][:legs][0][:duration][:text]
    trip[:lat] = trip_data[:routes][0][:legs][0][:end_location][:lat]
    trip[:long] = trip_data[:routes][0][:legs][0][:end_location][:lng]
    trip
  end
end
