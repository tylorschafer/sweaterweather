class Darksky

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def create_forecast
    Forecast.new(json_response)
  end

  def json_response
    resp = Faraday.get(
      "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{@lat},#{@long}"
    )
    JSON.parse(resp.body, symbolize_names: true)
  end
end
