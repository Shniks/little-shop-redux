require './app/models/invoice.rb'
require './app/models/invoice_item.rb'
require './app/models/item.rb'

RSpec.describe Invoice do
  describe 'Class Methods' do
    before(:each) do
      invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
      invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
      invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)

      invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 10, status: 'pending')
      item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 4)
      item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 4)
      invoice_item_3 = invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
      invoice_item_4 = invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    it 'Calculates the total_price for the invoice' do
      invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
      invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
      invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)

      invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 10, status: 'pending')
      item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 4)
      item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 4)
      invoice_item_3 = invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
      invoice_item_4 = invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
      
      expect(invoice_1.total_price(1)).to eq(417582.0)
    end

    it 'Finds the invoice with highest unit price' do
      expect(Invoice.highest_price.first.invoice_id).to eq(1)
      expect(Invoice.highest_price.first.invoice_id).to_not eq(2)
      expect(Invoice.highest_price.first).to be_an_instance_of(InvoiceItem)
    end

    it 'Finds the invoice with highest unit price' do
      expect(Invoice.lowest_price.first.invoice_id).to eq(2)
      expect(Invoice.lowest_price.first.invoice_id).to_not eq(1)
      expect(Invoice.lowest_price.first).to be_an_instance_of(InvoiceItem)
    end

    it 'Finds the invoice with hightest quantity' do
      expect(Invoice.highest_quantity.invoice_id).to eq(1)
      expect(Invoice.highest_quantity.invoice_id).to_not eq(2)
      expect(Invoice.highest_quantity).to be_an_instance_of(InvoiceItem)
    end

    it 'Finds the invoice with lowest quantity' do
      expect(Invoice.lowest_quantity.invoice_id).to eq(2)
      expect(Invoice.lowest_quantity.invoice_id).to_not eq(1)
      expect(Invoice.lowest_quantity).to be_an_instance_of(InvoiceItem)
    end

  #   it 'Calculates the total_price for the invoice' do
  #     invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
  #     item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
  #     invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
  #     item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
  #     invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)
  #
  #     expect(Invoice.total_price).to eq(417582.0)
  #   end
  #
  #   it 'Finds the invoice with highest unit price' do
  #     invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
  #     item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
  #     item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
  #     invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
  #     invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)
  #
  #     invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 10, status: 'pending')
  #     item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 4)
  #     item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 4)
  #     invoice_item_3 = invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
  #     invoice_item_4 = invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
  #
  #     expect(Invoice.highest_price.first.invoice_id).to eq(1)
  #     expect(Invoice.highest_price.first.invoice_id).to_not eq(2)
  #     expect(Invoice.highest_price.first).to be_an_instance_of(InvoiceItem)
  #   end
  #
  #   it 'Finds the invoice with highest unit price' do
  #     invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
  #     item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
  #     item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
  #     invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
  #     invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)
  #
  #     invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 10, status: 'pending')
  #     item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 4)
  #     item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 4)
  #     invoice_item_3 = invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
  #     invoice_item_4 = invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
  #
  #     expect(Invoice.lowest_price.first.invoice_id).to eq(2)
  #     expect(Invoice.lowest_price.first.invoice_id).to_not eq(1)
  #     expect(Invoice.lowest_price.first).to be_an_instance_of(InvoiceItem)
  #   end
  #
  #   it 'Finds the invoice with hightest quantity' do
  #     invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
  #     item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
  #     invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
  #     item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
  #     invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)
  #
  #     expect(Invoice.highest_quantity.invoice_id).to eq(1)
  #     expect(Invoice.highest_quantity.invoice_id).to_not eq(2)
  #     expect(Invoice.highest_quantity).to be_an_instance_of(InvoiceItem)
  #   end
  #
  #   it 'Finds the invoice with lowest quantity' do
  #     invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
  #     item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
  #     item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
  #     invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
  #     invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)
  #
  #     invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 10, status: 'pending')
  #     item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 4)
  #     item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 4)
  #     invoice_item_3 = invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
  #     invoice_item_4 = invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
  #
  #     expect(Invoice.lowest_quantity.invoice_id).to eq(2)
  #     expect(Invoice.lowest_quantity.invoice_id).to_not eq(1)
  #     expect(Invoice.lowest_quantity).to be_an_instance_of(InvoiceItem)
  #   end
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
