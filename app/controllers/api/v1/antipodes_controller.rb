class Api::V1::AntipodesController < ApplicationController
  def show
    pode = find_antipode
    lat = pode[:data][:attributes][:lat]
    long = pode[:data][:attributes][:long]
    found_city = find_city(lat, long)
    forecast = find_forecast(lat, long)
    render json: AntipodeSerializer.new(found_city, forecast, params[:location])
                                   .serialized_json
  end

  def find_forecast(lat, long)
    Darksky.new(lat, long).create_forecast
  end

  def find_city(lat, long)
    GoogleGeocoding.reverse_lookup(lat, long)
  end

  def find_antipode
    coordinates = GoogleGeocoding.coordinates(params[:location])
    lat = coordinates[:data][:lat]
    long = coordinates[:data][:lng]
    Amypode.find_antipode(lat, long)
  end
end
