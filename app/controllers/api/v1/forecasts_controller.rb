class ForecastsController < ApplicationController

  def show
    render json: ForecastSerializer.new(Forecast.new(params[:location]))
  end
end
