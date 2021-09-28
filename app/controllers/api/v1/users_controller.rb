class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      user.update(api_key: SecureRandom.hex)
      render json: UsersSerializer.new(user), status: :created
    else
      render json: { error: "#{user.errors.full_messages.first}." }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
