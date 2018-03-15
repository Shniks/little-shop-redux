describe 'As a user' do
  context 'I visit a particular merchant\'s page to edit it' do
    it 'I can see navbar links' do
      Merchant.create(name: 'Tyler')
      visit '/merchants/1/edit'

      expect(page).to have_content('Home')
      expect(page).to have_content('Items')
      expect(page).to have_content('Merchants')
    end

    it 'I can see content in the body' do
      Merchant.create(name: 'Tyler')
      visit '/merchants/1/edit'

      expect(page).to have_content('Tyler')
      expect(page).to have_content('1')
    end

    it 'I can see input box to edit merchant' do
      Merchant.create(name: 'Tyler')
      visit '/merchants/1/edit'
      fill_in("merchant[name]", :with => 'Sergio')

      click_button('Submit')
      expect(page).to have_content('Sergio')
    end
  end
end
