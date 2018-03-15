require './app/models/invoice.rb'

RSpec.describe Invoice do
  describe 'Class Methods' do
  end

  describe 'Validate fields' do
    it 'is invalid to not have a customer_id' do
      invoice = Invoice.new(merchant_id: 8, status: 'pending')
      expect(invoice).to_not be_valid
    end

    it 'is invalid to not have a merchant_id' do
      invoice = Invoice.new(customer_id: 3, status: 'pending')
      expect(invoice).to_not be_valid
    end

    it 'is invalid to not have a status' do
      invoice = Invoice.new(customer_id: 8, merchant_id: 88)
      expect(invoice).to_not be_valid
    end
  end
end
