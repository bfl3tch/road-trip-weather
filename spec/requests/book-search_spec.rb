require 'rails_helper'

RSpec.describe 'Book-Search API' do
  describe 'index action' do
    context 'happy path' do
      before(:each) do
        get '/api/v1/book-search?location=denver,co&quantity=5'
        @results_hash = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns the forecast data for a specific location', :vcr do
        expect(response.status).to eq(200)
        require "pry"; binding.pry
      end

      xit 'returns current, next 5 days, and next 8 hours of weather', :vcr do
      end

      xit 'does not have unnecessary information from the weather API call', :vcr do
      end
    end
  end
end
