class Forecast
  attr_reader :id, :current, :next_8_hrs, :next_5_days, :presenter

  def initialize(resp = {})
    @id = 0
    @presenter = ForecastPresenter.new(resp)
    @current = presenter.current
    @next_8_hrs = presenter.hourly
    @next_5_days = presenter.weekly
  end
end
