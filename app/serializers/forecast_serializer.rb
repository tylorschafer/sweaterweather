class ForecastSerializer
attr_reader :forecast

  def initialize(forecast)
    @forecast = forecast
  end

  def serialized_json
    {
      data:
        {
          current: forecast.current,
          next_8_hrs: forecast.next_8_hrs,
          next_5_days: forecast.next_5_days
        }
    }.to_json
  end
end
