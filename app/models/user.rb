class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_token
    JWT.encode({ id: id }, Rails.application.secrets.secret_key_base)
  end
end
