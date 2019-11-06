class ForecastPresenter
  attr_reader :response
  
  def initialize(response)
    @response = response
  end

  def current
    {
      app_temp: response[:currently][:apparentTemperature],
      dal_temp_low: response[:daily][:data][0][:temperatureLow],
      dal_temp_high: response[:daily][:data][0][:temperatureHigh],
      day_summary: response[:hourly][:data][11][:summary],
      humidity: response[:currently][:humidity],
      icon: response[:currently][:icon],
      night_summary: response[:hourly][:data][19][:summary],
      summary: response[:currently][:summary],
      temp: response[:currently][:temperature],
      time: Time.at(response[:currently][:time]).strftime("%I:%M%p"),
      timezone: response[:timezone],
      uv: response[:currently][:uvIndex],
      visibility: response[:currently][:visibility]
    }
  end

  def hourly
    hours = response[:hourly][:data].first(8).map do |hour|
      {
        icon: hour[:icon],
        temp: hour[:temperature],
        time: Time.at(hour[:time]).strftime("%I:%M%p")
      }
    end
    hours
  end

  def weekly
    weekly = response[:daily][:data].first(5).map.with_index do |day, index|
      {
        icon: day[:icon],
        day: (DateTime.now + index.days).strftime("%A"),
        summary: day[:summary],
        percip_prob: day[:precipProbability],
        temp_high: day[:temperatureHigh],
        temp_low: day[:temperatureLow]
      }
    end
    weekly
  end
end
