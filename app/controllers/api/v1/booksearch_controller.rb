class Api::V1::BooksearchController < ApplicationController
  before_action :book_searcher, only: [:index]
  # rescue_from NoMethodError, with: :error_generator

  def index
    render json: BooksSerializer.new(@books) if @books
  end

  private

  def book_searcher
    # ((params[:location] && !params[:location].nil?) && (params[:quantity] && params[:quantity].to_i > 0))
      @books = BooksearchFacade.get_books(params[:location], params[:quantity])
  end

  def error_generator
    render json: {error: { error_message: 'Invalid Entry' } }
  end
end
