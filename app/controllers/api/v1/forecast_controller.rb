class Api::V1::ForecastController < ApplicationController
  before_action :weather_determinator, only: [:index]
  rescue_from NoMethodError, with: :error_generator

  def index
    @weather ? render_response : error_generator
  end

  private

  def render_response
    render json: ForecastSerializer.new(@weather)
  end

  def weather_determinator
    ForecastFacade.lat_long(params[:location])
    @weather = ForecastFacade.weather_getter
  end

  def error_generator
    render json: { error: 'Invalid Entry' }, status: :unprocessable_entity
  end
end
