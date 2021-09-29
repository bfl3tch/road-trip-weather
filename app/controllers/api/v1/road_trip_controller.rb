class Api::V1::RoadTripController < ApplicationController
  before_action :found_user, only: [:create]
  def create
    if found_user
      if trip_params[:origin] && trip_params[:destination]
        generate_response(trip_params[:origin], trip_params[:destination])
      else
        generate_error('Must have both origin and destination query params', :unprocessable_entity)
      end
    else
      generate_error('Invalid API key')
    end
  end

  private

  def found_user
    User.find_by(api_key: params[:api_key]) if params[:api_key]
  end

  def generate_response(origin, destination)
    trip = RoadTripFacade.trip(origin, destination)
    render json: RoadTripSerializer.new(trip), status: :created
  end

  def generate_error(error_message, status = :unauthorized)
    render json: { error: "#{error_message}" }, status: status
  end

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
