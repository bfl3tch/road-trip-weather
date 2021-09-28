class User < ApplicationRecord
  has_secure_password
  # validates_presence_of :email, :password, :password_confirmation, :api_key
  # validates_uniqueness_of :email, :api_key
end
