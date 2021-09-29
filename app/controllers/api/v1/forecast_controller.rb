class Api::V1::ForecastController < ApplicationController
  before_action :weather_determinator, only: [:index]
  rescue_from NoMethodError, with: :error_generator

  def index
    render json: ForecastSerializer.new(@weather) if @weather
  end

  private

  def weather_determinator
    ForecastFacade.lat_long(params[:location])
    @weather = ForecastFacade.weather_getter
  end

  def error_generator
    render json: {error: { error_message: 'Invalid Entry' } }
  end
end
