class GoogleGeocoding
  def self.coordinates(location)
    new.find_coordinates(location)
  end

  def self.reverse_lookup(lat, long)
    new.reverse_find(lat, long)
  end

  def reverse_find(lat, long)
    resp = Faraday.get(
      'https://maps.googleapis.com/maps/api/geocode/json') do |f|
        f.params = {
          key: ENV['GOOGLE_API_KEY'],
          latlng: "#{lat},#{long}"
        }
    end
    result = JSON.parse(resp.body, symbolize_names: true)
    format_reverse_find(result)
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
    format_coordinates(result)
  end

  private

  def format_coordinates(result)
    formatted_resp = Hash.new
    formatted_resp[:data] = result[:results][0][:geometry][:location]
    formatted_resp
  end

  def format_reverse_find(result)
    formatted_resp = Hash.new
    formatted_resp[:data] = result[:results][0][:formatted_address]
    formatted_resp
  end
end
