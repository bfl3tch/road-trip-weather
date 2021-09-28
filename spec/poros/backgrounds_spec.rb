require 'rails_helper'

RSpec.describe Backgrounds do
  before(:each) do
    @hash = JSON.parse(File.read('./spec/fixtures/test_data/backgrounds_hash.rb'), symbolize_names: true)
  end
  
  describe 'instantiation' do
    it 'creates a backgrounds object' do
      expect(@hash).to be_an_instance_of(Hash)
    end
  end

  describe 'attributes' do
    it 'has proper backgrounds attributes' do
      expect(@hash.keys).to eq([:data])
      expect(@hash[:data][:type]).to eq('backgrounds')
      expect(@hash[:data][:attributes].keys).to include(:image)
      expect(@hash[:data][:attributes][:image].first.keys).to include(:urls)
      expect(@hash[:data][:attributes][:image].first.keys).to include(:user)
      expect(@hash[:data][:attributes][:image].first[:user].keys).to include(:name)
    end
  end
end
