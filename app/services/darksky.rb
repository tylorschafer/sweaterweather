class Darksky

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def json_response
    resp = Faraday.get(
      "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{@lat},#{@long}"
    )
    results = JSON.parse(resp.body, symbolize_names: true)
  end
end
