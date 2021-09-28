class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates_confirmation_of :password
  validates :password_confirmation, presence: true, on: :create
  validates :api_key, uniqueness: true, presence: true, on: :update

  # def self.valid_api_key?(api_key)
  #   find_by(api_key: api_key)
  # end
end
