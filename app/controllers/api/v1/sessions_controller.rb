class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: user_params[:email])

    valid_user ? render_response : generate_error
  end

  private

  def valid_user
    @user && @user.authenticate(user_params[:password])
  end

  def render_response
    render json: UsersSerializer.new(@user), status: :created
  end

  def user_params
    params.permit(:email, :password)
  end

  def generate_error(status = :unauthorized)
    render json: { error: "Unable to log in. Please try again." },
                   status: status
  end
end
