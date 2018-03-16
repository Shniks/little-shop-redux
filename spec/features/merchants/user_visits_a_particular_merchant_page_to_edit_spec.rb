describe 'As a user' do
  context 'I visit a particular merchant\'s page to edit it' do
    it 'I can see navbar links' do
      merchant = Merchant.create(name: 'Tyler')
      visit "/merchants/#{merchant.id}/edit"

      expect(page).to have_content('Home')
      expect(page).to have_content('Items')
      expect(page).to have_content('Merchants')
    end
    
    it 'I can see input box to edit merchant' do
      merchant = Merchant.create(name: 'Tyler')
      visit "/merchants/#{merchant.id}/edit"
      fill_in("merchant[name]", :with => 'Sergio')

      click_button('Submit')
      expect(page).to have_content('Sergio')
    end
  end
end
