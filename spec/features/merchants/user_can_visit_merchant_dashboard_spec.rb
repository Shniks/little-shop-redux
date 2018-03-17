describe 'Merchant Dashboard' do
  context 'I can visit the merchant dashboard' do
    before(:each) do
      @merchant1 = Merchant.create(name: 'Tyler')
      @merchant2 = Merchant.create(name: 'Nikhil')
      @merchant3 = Merchant.create(name: 'Kyle')
      @merchant4 = Merchant.create(name: 'Ian')
      @merchant5 = Merchant.create(name: 'Ali')
    end

    after(:each) do
      DatabaseCleaner.clean
    end

    it 'I can see merchants on the page' do
      visit '/merchants-dashboard'

      expect(page).to have_content('Tyler')
      expect(page).to have_content(@merchant1.name)
      expect(page).to have_content('Nikhil')
      expect(page).to have_content(@merchant2.name)
      expect(page).to have_content('Kyle')
      expect(page).to have_content(@merchant3.name)
      expect(page).to have_content('Ian')
      expect(page).to have_content(@merchant4.name)
      expect(page).to have_content('Ali')
      expect(page).to have_content(@merchant5.name)
    end

    it 'I can see total number of items for a merchant' do
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 5)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 5)
      visit '/merchants-dashboard'

      expect(page).to have_content('Ali')
      expect(page).to have_content('Item Count: 2')
    end

    it 'I can see average item price for a merchant' do
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 5)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 5)
      visit '/merchants-dashboard'

      expect(page).to have_content('Ali')
      expect(page).to have_content('Avg Item Price: $499.50')
    end

    it 'I can see the total cost of items on merchant dashboard' do
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 5)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 5)
      visit '/merchants-dashboard'

      expect(page).to have_content('Ali')
      expect(page).to have_content('Total Cost of Items: $999.00')
    end
  end
end
