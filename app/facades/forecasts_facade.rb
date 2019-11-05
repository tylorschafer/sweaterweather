class ForecastsFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def coordinates
    GoogleGeocodingService.coordinates(location)[:data]
  end

  def forecast
    forecast = DarkskyService.new(coordinates[:lat], coordinates[:lng])
    Forecast.new(forecast.json_response)
  end
end
