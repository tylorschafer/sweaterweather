class GoogleGeocoding
  def self.coordinates(location)
    new.find_coordinates(location)
  end

  def self.reverse_lookup(lat, long)
    new.reverse_find(lat, long)
  end

  def reverse_find(lat, long)
    params = { latlng: "#{lat},#{long}" }
    resp = conn(params)
    result = JSON.parse(resp.body, symbolize_names: true)
    format_reverse_find(result)
  end

  def find_coordinates(location)
    params = { address: location }
    resp = conn(params)
    result = JSON.parse(resp.body, symbolize_names: true)
    format_coordinates(result)
  end

  private

  def conn(params)
    Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params = { key: ENV['GOOGLE_API_KEY'] }.merge!(params)
    end
  end

  def format_coordinates(result)
    formatted_resp = Hash.new
    formatted_resp[:data] = result[:results][0][:geometry][:location]
    formatted_resp
  end

  def format_reverse_find(result)
    formatted_resp = Hash.new
    formatted_resp[:data] = {
      city: result[:results][0][:formatted_address].split(',')[1]
    }
    formatted_resp
  end
end
