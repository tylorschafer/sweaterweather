class GoogleGeocoding
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
    result = JSON.parse(resp.body, symbolize_names: true)
    format_data(result)
  end

  private

  def format_data(result)
    formatted_resp = Hash.new
    formatted_resp[:data] = result[:results][0][:geometry][:location]
    formatted_resp
  end
end
