class Api::V1::ForecastsController < ApplicationController
  def show
    facade = ForecastsFacade.new(params[:location])
    render json: ForecastSerializer.new(facade.forecast)
  end
end
