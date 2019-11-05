class Api::V1::RoadTripsController < ApplicationController
  def create
    if authenticate_user
      trip_facade = RoadTripFacade.new(params[:origin], params[:destination])
      render json: RoadTripPresenter.to_json(trip_facade.trip)
    end
  end
end
