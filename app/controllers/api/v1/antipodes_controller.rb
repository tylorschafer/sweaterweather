class Api::V1::AntipodesController < ApplicationController
  def show
    coordinates = GoogleGeocoding.coordinates(params[:location])
    amy = Amypode.new(coordinates[:data][:lat], coordinates[:data][:lng]).find_antipode
    found_city = GoogleGeocoding.reverse_lookup(
      amy[:data][:attributes][:lat],amy[:data][:attributes][:long]
    )
    forecast = Darksky.new(amy[:data][:attributes][:lat],amy[:data][:attributes][:long])
      .create_forecast
    render json: AntipodeSerializer.new(found_city, forecast, params[:location])
      .serialized_json
  end
end
