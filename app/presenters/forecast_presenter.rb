class ForecastPresenter
  def self.to_json(forecast)
    new.serialized_json(forecast)
  end

  def serialized_json(forecast)
    {
      data: {
        current: forecast.current,
        next_8_hrs: forecast.next_8_hrs,
        next_5_days: forecast.next_5_days
      }
    }.to_json
  end
end
