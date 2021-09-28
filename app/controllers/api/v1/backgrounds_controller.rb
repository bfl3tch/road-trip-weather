class Api::V1::BackgroundsController < ApplicationController
  before_action :backgrounds_determinator, only: [:index]
  rescue_from NoMethodError, with: :error_generator

  def index
    render json: BackgroundsSerializer.new(@backgrounds) if @backgrounds
    if @backgrounds.nil?
      error_generator
    end
  end

  private

  def backgrounds_determinator
    if (params[:location])
      @backgrounds = BackgroundsFacade.get_backgrounds(params[:location])
    end
  end

  def error_generator
    render json: {error: { error_message: 'Invalid Entry' } }
  end
end
