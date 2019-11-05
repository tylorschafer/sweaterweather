class Api::V1::ForecastsController < ApplicationController

  def show
    coordinates = GoogleGeocodingService.coordinates(params[:location])
    lat = coordinates[:data][:lat]
    long = coordinates[:data][:lng]
    forecast = DarkskyService.new(lat, long)
    render json: ForecastSerializer.new(Forecast.new(forecast.json_response))
  end
end
