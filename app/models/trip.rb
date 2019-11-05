class Trip
  attr_reader :distance, :duration, :weather_summary
  def initialize(params = {})
    @distance = params[:distance]
    @duration = params[:duration]
    @weather_summary = params[:weather_summary]
  end
end
