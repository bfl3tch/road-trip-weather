require 'rails_helper'

RSpec.describe 'Backgrounds API' do
  describe 'index action' do
    context 'happy path' do
      before(:each) do
        get '/api/v1/backgrounds?location=denver,co'
        @results_hash = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns the background data for a specific image from the search', :aggregate_failures, :vcr do
        expect(@results_hash[:data][:type]).to eq("backgrounds")
        expect(@results_hash[:data][:attributes].keys).to eq([:location, :image])
      end

      it 'returns attributes with image having location, url, source, author, and logo', :vcr do
        expect(@results_hash[:data][:attributes][:image].first.keys).to eq(
          [:image_url, :credit])
        expect(@results_hash[:data][:attributes][:image].first[:credit].keys).to eq(
          [:source, :author, :author_profile, :author_image])
      end
    end

    context 'sad path' do
      context 'empty location params' do
        before(:each) do
          get '/api/v1/backgrounds?location='
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns empty datasets', :vcr do
          expect(@results_hash).to eq(
            {
              :data=>{
                :attributes=>{
                  :image=>[], :location=>""
                  },
                :id=>nil, :type=>"backgrounds"}
            })
        end
      end

      context 'missing location params' do
        before(:each) do
          get '/api/v1/backgrounds'
          @results_hash = JSON.parse(response.body, symbolize_names: true)
        end

        it 'returns an error message', :vcr do
          expect(@results_hash.keys).to eq([:error])
          expect(@results_hash). to eq(
            {:error=>
              {:error_message=>"Invalid Entry"}
            })
        end
      end
    end
  end
end
