require './app/models/invoice.rb'
require './app/models/invoice_item.rb'
require './app/models/item.rb'

RSpec.describe Invoice do
  describe 'Class Methods' do
    it 'Calculates the total_price for the invoice' do
      invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
      invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
      invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Invoice.total_price).to eq(999)
  end

  describe 'Validate fields' do
    it 'Is invalid to not have a customer_id' do
      invoice = Invoice.new(merchant_id: 8, status: 'pending')
      expect(invoice).to_not be_valid
    end

    it 'Is invalid to not have a merchant_id' do
      invoice = Invoice.new(customer_id: 3, status: 'pending')
      expect(invoice).to_not be_valid
    end

    it 'Is invalid to not have a status' do
      invoice = Invoice.new(customer_id: 8, merchant_id: 88)
      expect(invoice).to_not be_valid
    end
  end
end
