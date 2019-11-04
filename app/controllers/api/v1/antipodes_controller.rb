class Api::V1::AntipodesController < ApplicationController
  def show
    coordinates = GoogleGeocoding.coordinates(params[:location])
    lat = coordinates[:data][:lat]
    long = coordinates[:data][:lng] 
  end
end
