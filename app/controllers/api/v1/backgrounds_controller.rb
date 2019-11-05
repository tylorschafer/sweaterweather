class Api::V1::BackgroundsController < ApplicationController

  def index
    service = Flickr.new(params[:location])
    render json: BackgroundSerializer.new(service.returned_photos)
  end
end
