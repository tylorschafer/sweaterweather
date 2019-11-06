class Forecast
  attr_reader :id, :current, :next_8_hrs, :next_5_days

  def initialize(resp = {})
    @id = 0
    @current = load_current(resp)
    @next_8_hrs = load_hours(resp)
    @next_5_days = load_weekly(resp)
  end

  def load_current(resp)
    {
      app_temp: resp[:currently][:apparentTemperature],
      dal_temp_low: resp[:daily][:data][0][:temperatureLow],
      dal_temp_high: resp[:daily][:data][0][:temperatureHigh],
      day_summary: resp[:hourly][:data][11][:summary],
      humidity: resp[:currently][:humidity],
      icon: resp[:currently][:icon],
      night_summary: resp[:hourly][:data][19][:summary],
      summary: resp[:currently][:summary],
      temp: resp[:currently][:temperature],
      time: Time.at(resp[:currently][:time]).strftime("%I:%M%p"),
      timezone: resp[:timezone],
      uv: resp[:currently][:uvIndex],
      visibility: resp[:currently][:visibility]
    }
  end

  def load_hours(resp)
    hours = resp[:hourly][:data].first(8).map do |hour|
      {
        icon: hour[:icon],
        temp: hour[:temperature],
        time: Time.at(hour[:time]).strftime("%I:%M%p")
      }
    end
    hours
  end

  def load_weekly(resp)
    weekly = resp[:daily][:data].first(5).map.with_index do |day, index|
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
