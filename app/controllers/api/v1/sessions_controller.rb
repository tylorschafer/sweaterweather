class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(sign_in_params[:email])

    binding.pry

    if user && user.valid_password?(sign_in_params[:password])
      render json: {api_key: user.token}
    else
      render json: { errors: { 'email or password' => ['is invalid'] } },
             status: :unprocessable_entity
    end
  end

  private

  def sign_in_params
    params.permit(:email, :password)
  end
end
