class Api::V1::RoadTripsController < ApplicationController

  def create
    trip_facade = RoadTripFacade.new(params[:origin], params[:destination])
    render json: RoadTripSerializer.create(trip_facade.trip)
  end
end
