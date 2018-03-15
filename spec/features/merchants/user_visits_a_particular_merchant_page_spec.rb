describe 'As a user' do
  context 'I visit a particular merchant\'s page' do
    it 'I can see navbar links' do
      Merchant.create(name: 'Tyler')
      visit '/merchants/1'

      expect(page).to have_content('Home')
      expect(page).to have_content('Items')
      expect(page).to have_content('Merchants')
    end

    it 'I can see content in the body' do
      visit '/merchants/1'
      Merchant.create(name: 'Tyler')
      visit '/merchants/1'

      expect(page).to have_content('Tyler')
    end
  end
end
