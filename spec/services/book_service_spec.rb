require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    describe '::get_books' do
      context 'happy path' do
        it 'gets books about a particular city', :vcr do
          response = BookService.get_books('denver, co')
          expect(response).to be_a(Hash)
        end
      end
    end
  end
end
