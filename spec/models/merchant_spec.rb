require './app/models/merchant.rb'

RSpec.describe Merchant do
  describe 'Class Methods' do
    it 'Calculates total number of items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      expect(Merchant.total_items(2)).to eq(2)
    end

    it 'Calculates average price of items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      expect(Merchant.average_price(2)).to eq(499.50)
    end

    it 'Calculates total price of all items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.total_sales(2)).to eq(417582.00)
    end

    it 'Finds the max_price for all items' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.max_price).to eq(999)
      expect(Merchant.max_price).to_not eq(666)
      expect(Merchant.max_price).to_not eq(444)
    end

    it 'Finds the item from max_price' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.find_item_for_max_price).to be_an_instance_of(Item)
      expect(Merchant.find_item_for_max_price.name).to eq('mjolnir')
      expect(Merchant.find_item_for_max_price).to_not be_an_instance_of(Merchant)
    end

    it 'Finds the merchant id from the item' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.find_merchant_id_from_price).to eq(2)
      expect(Merchant.find_merchant_id_from_price).to_not eq(1)
    end

    it 'Finds the merchant name from the id' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.merchant_with_highest_price_item).to eq('Nikhil')
      expect(Merchant.merchant_with_highest_price_item).to_not eq('Tyler')
    end

    it 'Finds the max_quantity' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.max_quantity).to eq(774)
      expect(Merchant.max_quantity).to_not eq(108)
    end

    it 'Finds the item from max_quantity' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.find_item_for_max_quantity).to be_an_instance_of(Item)
      expect(Merchant.find_item_for_max_quantity.name).to eq('mjolnir')
      expect(Merchant.find_item_for_max_quantity).to_not be_an_instance_of(Merchant)
    end

    it 'Finds the merchant id from the item' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.find_merchant_id_from_quantity).to eq(2)
      expect(Merchant.find_merchant_id_from_quantity).to_not eq(1)
    end

    it 'Finds the merchant name from the id' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.merchant_with_highest_quantity).to eq('Nikhil')
      expect(Merchant.merchant_with_highest_quantity).to_not eq('Tyler')
    end
  end

  describe 'Validate fields' do
    it 'Is invalid to not have a name' do
      merchant = Merchant.new()
      expect(merchant).to_not be_valid
    end
  end
end
