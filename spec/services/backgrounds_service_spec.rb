require 'rails_helper'

RSpec.describe BackgroundsService do
  describe 'class methods' do

    describe '::connection' do
      it 'establishes the params and connection to the unsplash photos search api' do
        setup = BackgroundsService.connection
        expect(setup.headers).to include('Authorization')
      end
    end

    describe '::get_backgrounds' do
      context 'happy path' do
        it 'gets full-sized background images for a specific location', :vcr do
          response = BackgroundsService.get_backgrounds('denver,co')

          expect(response).to be_a(Hash)
          expect(response.keys).to include(:results)
          expect(response[:results].first.keys).to include(:urls)
          expect(response[:results].first[:urls].keys).to include(:full)
        end
      end

      context 'sad path' do
        it 'returns a hash showing no results if no valid search given', :vcr do
          response = BackgroundsService.get_backgrounds('')

          expect(response).to be_a(Hash)

          expect(response.keys).to include(:total)
          expect(response[:total]).to eq(0)

          expect(response.keys).to include(:total_pages)
          expect(response[:total_pages]).to eq(0)

          expect(response.keys).to include(:results)
          expect(response[:results]).to eq([])
        end
      end
    end
  end
end
