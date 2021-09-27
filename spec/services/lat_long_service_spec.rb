require 'rails_helper'

RSpec.describe LatLongService do
  describe 'class methods' do

    describe '::connection' do
      it 'establishes the params and connection to the mapquest geocoding api' do
        setup = LatLongService.connection

        expect(setup.params).to include('key')
      end
    end
    describe '::get_lat_long' do
      context 'happy path' do
        it 'gets weather for a specific location', :vcr do
          response = LatLongService.get_lat_long('Denver, CO')
          expect(response).to be_a(Hash)
          expect(response[:results].first[:locations].first[:latLng].keys).to eq([:lat, :lng])
        end
      end

      context 'sad path' do
        it 'returns an empty array if an invalid location is provided', :vcr do
          response = LatLongService.get_lat_long('kjdashfjkadsghjklasdghkjlasdfhgjkldsghlkjsdfghdgjklsfghld')

          expect(response[:results].first[:locations].blank?).to eq(true)
        end
      end
    end
  end
end
