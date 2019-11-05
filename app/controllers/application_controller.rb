class ApplicationController < ActionController::API

  respond_to :json

  def authenticate_user
    begin
      JWT.decode(params[:api_key], Rails.application.secrets.secret_key_base, false)
    rescue
      render json: 'Invalid Key'
      return false
    end
  end
end
