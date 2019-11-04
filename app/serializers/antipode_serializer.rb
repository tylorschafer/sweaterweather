class AntipodeSerializer

  def initialize(found_city, forecast, searched_city)
    @found_city = found_city[:data][:city]
    @forecast = forecast
    @summary = @forecast.current[:summary]
    @current_temperature = @forecast.current[:temp]
    @searched_city = searched_city
  end

  def serialized_json
    {
      data: {
        type: 'antipode',
        attributes: {
          location_name: @found_city,
          forecast: {
            summary: @summary,
            current_temperature: @current_temperature
          },
        },
      search_location: @searched_city
      }
    }.to_json
  end
end
