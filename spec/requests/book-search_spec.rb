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
        expect(@results_hash.keys).to include(:data)
        expect(@results_hash[:data].keys).to eq([:id, :type, :attributes])
      end

      it 'returns the destination from the search', :vcr do
        expect(@results_hash[:data][:attributes].keys).to include(:destination)
      end

      it 'returns the forecast for that location', :vcr do
        expect(@results_hash[:data][:attributes].keys).to include(:forecast)
        expect(@results_hash[:data][:attributes][:forecast].keys).to eq([:summary, :temperature])
      end

      it 'returns the total number of books that were found', :vcr do
        expect(@results_hash[:data][:attributes].keys).to include(:total_books_found)
      end

      it 'returns the quantity of books requested', :vcr do
        expect(@results_hash[:data][:attributes][:books].size).to eq(5)
      end

      it 'returns information about each of the books', :vcr do
        expect(@results_hash[:data][:attributes][:books][0].keys).to eq([:isbn, :title, :publisher])
      end
    end

    context 'sad path' do
      context 'missing quantity params' do
        before(:each) do
          get '/api/v1/book-search?location=denver,co'
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns an error message for an invalid entry', :vcr do
          expect(@results_hash.keys).to eq([:error])
        end
      end

      context 'negative quantity params' do
        before(:each) do
          get '/api/v1/book-search?location=denver,co&quantity=-1'
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns an error message for an invalid entry', :vcr do
          expect(@results_hash.keys).to eq([:error])
        end
      end

      context 'zero quantity params' do
        before(:each) do
          get '/api/v1/book-search?location=denver,co&quantity=0'
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns an error message for an invalid entry', :vcr do
          expect(@results_hash.keys).to eq([:error])
        end
      end

      context 'missing location params' do
        before(:each) do
          get '/api/v1/book-search?quantity=1'
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns an error message for an invalid entry', :vcr do
          expect(@results_hash.keys).to eq([:error])
        end
      end

      context 'empty location params' do
        before(:each) do
          get '/api/v1/book-search?location=&quantity=1'
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns an error message for an invalid entry', :vcr do
          expect(@results_hash.keys).to eq([:error])
        end
      end
    end
  end
end
