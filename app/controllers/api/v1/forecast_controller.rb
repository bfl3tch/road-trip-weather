class Api::V1::ForecastController < ApplicationController
  before_action :weather_determinator, only: [:index]

  def index
    render json: ForecastSerializer.new(@weather)
    render json: ForecastSerializer.new(@error) if @error
  end

  private

  def weather_determinator
    ForecastFacade.lat_long(params[:location]) if (params[:location] && !params[:location].nil?)
    @weather = ForecastFacade.weather_getter
  end
end
