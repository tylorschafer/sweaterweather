class GoogleDirectionsService
  def self.trip_info(origin, destination)
    new.find_trip(origin, destination)
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
end
