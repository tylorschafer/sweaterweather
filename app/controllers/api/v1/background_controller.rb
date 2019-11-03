class Api::V1::BackgroundController < ApplicationController

  def index
    service = Flickr.new(params[:location])
    render json: BackgroundSerializer.new(service)
  end
end
