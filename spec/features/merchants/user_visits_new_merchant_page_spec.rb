describe 'As a user' do
  context 'I visit merchant new page' do
    it 'I can see navbar links' do
      visit '/merchants/new'

      expect(page).to have_content('Home')
      expect(page).to have_content('Items')
      expect(page).to have_content('Merchants')
    end

    it 'I can see content in the body' do
      visit '/merchants/new'

      expect(page).to have_content('Create a New Merchant')
    end

    it 'I can see input box for a new merchant' do
      visit '/merchants/new'
      fill_in("merchant[name]", :with => 'Tyler')

      click_button('Submit')
      expect(page).to have_content('Tyler')
    end
  end
end
