class Api::V1::AuthenticationController < ApplicationController
  before_action :user_auth, only: [:create]
  class AuthenticationError < StandardError; end

  rescue_from ActionController::ParameterMissing, with: :paramater_missing
  rescue_from AuthenticationError, with: :handle_unauthenticated

  def create
    render json: { token: @token }, status: :created
  end

  private

  def user_auth
    user ||= User.find_by(email: params.require(:email))
    raise AuthenticationError unless user.authenticate(params.require(:password))
    @token = AuthenticationTokenService.call(user.email)
  end

  def user_params
    params.require(:email, :password)
  end

  def paramater_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def handle_unauthenticated(e)
    render json: { error: e.message }, status: :unauthorized
  end
end
