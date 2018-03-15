describe 'As a user' do
  context 'I visit a particular merchant\'s page' do
    it 'I can see navbar links' do
      merchant = Merchant.create(name: 'Tyler')
      visit "/merchants/#{merchant.id}"

      expect(page).to have_content('Home')
      expect(page).to have_content('Items')
      expect(page).to have_content('Merchants')
    end

    it 'I can see content in the body' do
      merchant = Merchant.create(name: 'Tyler')
      visit "/merchants/#{merchant.id}"

      expect(page).to have_content(merchant.name)
    end
  end
end
