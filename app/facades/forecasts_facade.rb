class ForecastsFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def coordinates
    coor_data = GoogleGeocodingService.coordinates(location)
    GoogleGeocodingPresenter.format_data(coor_data)[:data]
  end

  def forecast
    forecast = DarkskyService.get_forecast(coordinates[:lat], coordinates[:lng])
    Forecast.new(forecast)
  end
end
