class GoogleDirectionsService

  def self.trip_info(origin, destination)
    new.format_trip(origin, destination)
  end

  def find_trip(origin, destination)
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params = {
        key: ENV['GOOGLE_API_KEY'],
        origin: origin,
        destination: destination
      }
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def format_trip(origin, destination)
    trip = Hash.new
    response = find_trip(origin, destination)
    trip[:distance] = response[:routes][0][:legs][0][:distance][:text]
    trip[:duration] = response[:routes][0][:legs][0][:duration][:text]
    trip[:lat] = response[:routes][0][:legs][0][:end_location][:lat]
    trip[:long] = response[:routes][0][:legs][0][:end_location][:lng]
    trip
  end
end
