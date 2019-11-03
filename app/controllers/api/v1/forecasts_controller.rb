class Api::V1::ForecastsController < ApplicationController

  def show
    coordinates = GoogleGeocoding.coordinates(params[:location])
    lat = coordinates[:data][:lat]
    long = coordinates[:data][:lng]
    forecast = Darksky.new(lat, long).create_forecast
    render json: ForecastSerializer.new(forecast).serialized_json
  end
end
