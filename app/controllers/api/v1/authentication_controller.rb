class Api::V1::AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :paramater_missing

  def create
    user_params
    render json: { token: '123'}, status: :created
  end

  private

  def user_params
    params.require([:email, :password])
  end

  def paramater_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
