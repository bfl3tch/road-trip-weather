class Api::V1::UsersController < ApplicationController
  def create

  end

  private

  def user_params
    
  end
  def error_generator
    render json: {error: { error_message: 'Invalid Entry' } }
  end
end
