class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.create(sign_up_params)
    if user.save
      render json: 'this work?', status: 200
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  protected
  def sign_up_params
    params.permit(:email, :password, :password_confirmation)
  end
end
