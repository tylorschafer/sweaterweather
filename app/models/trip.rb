class Trip
  attr_reader :id, :distance, :duration, :weather_summary

  def initialize(trip_data = {}, forecast_data)
    @id = 2
    @distance = trip_data[:distance]
    @duration = trip_data[:duration]
    @forecast_data = forecast_data
    @weather_summary = format_weather
  end

  def format_weather
    weather_summary = {}
    weather_summary[:temperature] = @forecast_data[:temperature]
    weather_summary[:summary] = @forecast_data[:summary]
    weather_summary
  end
end
