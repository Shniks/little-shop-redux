describe 'As a User' do
  context 'I visit the items dashboard' do
    before(:each) do
      @merchant1 = Merchant.create(id: 1, name: 'Tyler')
      @merchant2 = Merchant.create(id: 2, name: 'Nikhil')
      @invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 1, status: 'pending')
      @item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 1)
      @item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 1)
      @invoice_item_1 = @invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
      @invoice_item_2 = @invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)

      @invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 2, status: 'shipped')
      @item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 2)
      @item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 2)
      @invoice_item_3 = @invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
      @invoice_item_4 = @invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    it 'I can see items data on the page' do
      visit '/items-dashboard'

      expect(page).to have_content('Items Dashboard')
      expect(page).to have_content('Total Item Count')
      expect(page).to have_content('Average Price of Items')
      expect(page).to have_content('Item by Age')
    end

    it 'I can see total item count' do
      visit '/items-dashboard'

      expect(page).to have_content('4')
    end

    it 'I can see average price of items' do
      visit '/items-dashboard'

      expect(page).to have_content('$2.69')
    end

    it 'I can see item by age' do
      visit '/items-dashboard'

      expect(page).to have_content('Cup')
      expect(page).to have_content('mjolnir')
    end
  end
end
