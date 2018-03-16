require './app/models/merchant.rb'

RSpec.describe Merchant do
  describe 'Class Methods' do

  end

  describe 'Validate fields' do
    it 'Is invalid to not have a name' do
      merchant = Merchant.new()
      expect(merchant).to_not be_valid
    end
  end
end
