class Trip
  attr_reader :id, :distance, :duration, :weather_summary
  def initialize(params = {})
    @id = 2
    @distance = params[:distance]
    @duration = params[:duration]
    @weather_summary = params[:weather_summary]
  end
end
