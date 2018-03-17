require './app/models/invoice_item.rb'
require './app/models/item.rb'
require './app/models/invoice.rb'

RSpec.describe InvoiceItem do
  describe 'Class Methods' do
  end

  context 'Validate fields' do
    it 'Is invalid to not have a item_id' do
      invoice_item = InvoiceItem.new(invoice_id: 18, quantity: 38, unit_price: 48)
      expect(invoice_item).to_not be_valid
    end

    it 'Is invalid to not have a invoice_id' do
      invoice_item = InvoiceItem.new(item_id: 8, quantity: 38, unit_price: 48)
      expect(invoice_item).to_not be_valid
    end

    it 'Is invalid to not have a quantity' do
      invoice_item = InvoiceItem.new(item_id: 8, invoice_id: 18, unit_price: 48)
      expect(invoice_item).to_not be_valid
    end

    it 'Is invalid to not have a unit_price' do
      invoice_item = InvoiceItem.new(item_id: 8, invoice_id: 18, quantity: 38)
      expect(invoice_item).to_not be_valid
    end
  end
end
