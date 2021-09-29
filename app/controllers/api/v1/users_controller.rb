class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    @user.save ? assign_key_and_respond : error_generator
  end

  private

  def assign_key_and_respond
    @user.update(api_key: SecureRandom.hex)
    render json: UsersSerializer.new(@user), status: :created
  end

  def error_generator
    render json: { error: "#{@user.errors.full_messages.first}." },
                   status: :unprocessable_entity
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
