require 'rails_helper'

RSpec.describe AuthenticationTokenService do
  describe '::call' do
    it 'returns an authentication token' do
      expect(described_class.call).to eq('123')
    end
  end
end
