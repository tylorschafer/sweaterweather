class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create(sign_up_params)
    if user.save
      token = user.generate_token
      render json: { api_key: token }
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  protected
  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end
end
