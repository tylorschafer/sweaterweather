class DarkskyService
  def self.get_forecast(lat, long)
    new.json_response(lat, long)
  end

  def json_response(lat, long)
    resp = Faraday.get(
      "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{long}"
    )
    JSON.parse(resp.body, symbolize_names: true)
  end
end
