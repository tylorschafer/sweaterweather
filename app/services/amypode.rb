class Amypode
  attr_reader :lat, :long

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def find_antipode
    response = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes") do |f|
      f.headers = { 'api_key': ENV['AMYPODE_API_KEY'] }
      f.params = { lat: lat, long: long }
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
