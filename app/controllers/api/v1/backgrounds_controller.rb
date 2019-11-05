class Api::V1::BackgroundsController < ApplicationController

  def index
    service = Flickr.new(params[:location])
    render json: BackgroundPresenter.to_json(service.returned_photos)
  end
end
