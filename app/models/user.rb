class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: { case_sensitive: false },
            presence: true,
            allow_blank: false

  def generate_token
    JWT.encode({ id: id }, Rails.application.secrets.secret_key_base)
  end
end
