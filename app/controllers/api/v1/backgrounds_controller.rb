class Api::V1::BackgroundsController < ApplicationController

  def index
    facade = BackgroundsFacade.new(params[:location])
    render json: BackgroundSerializer.new(facade.photos)
  end
end
