class Api::V1::BackgroundsController < ApplicationController
  before_action :backgrounds_determinator, only: [:index]
  rescue_from NoMethodError, with: :error_generator

  def index
    @backgrounds ? render_response : error_generator
  end

  private

  def render_response
    render json: BackgroundsSerializer.new(@backgrounds)
  end

  def backgrounds_determinator
    if (params[:location])
      @backgrounds = BackgroundsFacade.get_backgrounds(params[:location])
    end
  end

  def error_generator
    render json: {error: { error_message: 'Invalid Entry' } }
  end
end
