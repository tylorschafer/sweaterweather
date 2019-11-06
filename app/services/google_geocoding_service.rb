class GoogleGeocodingService
  def self.coordinates(location)
    new.find_coordinates(location)
  end

  def find_coordinates(location)
    resp = Faraday.get(
      'https://maps.googleapis.com/maps/api/geocode/json') do |f|
        f.params = {
          key: ENV['GOOGLE_API_KEY'],
          address: location
        }
    end
    JSON.parse(resp.body, symbolize_names: true)
  end
end
