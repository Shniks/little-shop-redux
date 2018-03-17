require './app/models/merchant.rb'

RSpec.describe Merchant do
  before(:each) do
    @merchant1 = Merchant.create(name: 'Tyler')
    @item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
    @merchant2 = Merchant.create(name: 'Nikhil')
    @item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
    @item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)

  describe 'Class Methods' do
    it 'calculates total number of items per merchant'
      merchant = Merchant.find(@merchant2.id)
      expect(merchant.total_items).to eq(2)
  end

  describe 'Validate fields' do
    it 'Is invalid to not have a name' do
      merchant = Merchant.new()
      expect(merchant).to_not be_valid
    end
  end
end
