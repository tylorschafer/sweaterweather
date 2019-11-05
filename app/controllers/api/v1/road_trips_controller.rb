class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.find_by(token: params[:api_key])
    if user
      trip_facade = RoadTripFacade.new(params[:origin], params[:destination])
      render json: RoadTripSerializer.create(trip_facade.trip)
    else
      render json: 'Invalid Credentials'
    end
  end
end
