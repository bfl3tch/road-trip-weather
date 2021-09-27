require 'rails_helper'

RSpec.describe Forecast do
  before(:each) do
    @hash = JSON.parse(File.read('./spec/fixtures/test_data/slim_hash.rb'), symbolize_names: true)

  end
  describe 'instantiation' do
    it 'creates a forecast object' do
      expect(@hash).to be_an_instance_of(Hash)
    end
  end

  describe 'attributes' do
    it 'has proper forecast attributes' do
      expect(@hash.keys).to eq([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
    end
  end
end
