require 'rails_helper'

RSpec.describe DirectionsService do
  describe 'class methods' do
    describe '::connection' do
      it 'establishes the params and connection to the unsplash photos search api', :vcr do
        setup = DirectionsService.connection
        expect(setup.params).to include('key')
      end
    end

    describe '::get_directions' do
      context 'happy path' do
        it 'gets directions for a route', :vcr do
          response = DirectionsService.get_directions('Marco Island, FL', 'Kennebunk, ME')

          expect(response).to be_a(Hash)
          expect(response[:route].keys).to include(:formattedTime)
          expect(response[:route][:routeError][:errorCode]).to eq(-400)

        end
      end

      context 'sad path' do
        it 'returns a hash showing no results if no valid desination given', :vcr do
          response = DirectionsService.get_directions('Marco Island, FL', '')

          expect(response).to be_a(Hash)
          expect(response[:route].keys).to eq([:routeError])
          expect(response[:info][:messages].first).to eq("At least two locations must be provided.")
        end

        it 'returns a hash showing no results if impossible route given', :vcr do
          response = DirectionsService.get_directions('Marco Island, FL', 'London, UK')

          expect(response).to be_a(Hash)
          expect(response[:route].keys).to eq([:routeError])
          expect(response[:info][:messages].first).to eq("We are unable to route with the given locations.")
        end
      end
    end
  end
end
