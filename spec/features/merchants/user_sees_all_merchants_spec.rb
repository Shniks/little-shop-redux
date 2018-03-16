describe 'As a user' do
  context 'I visit merchant index page' do
    it 'I can see all merchants' do
      merchant = Merchant.create(name: 'Tyler')
      visit '/merchants'

      expect(page).to have_content(merchant.name)
    end
  end

  context 'I click on the Navbar' do
    it 'I can see navbar links' do
      visit '/merchants'

      expect(current_path).to eq('/merchants')
      expect(page).to have_content('Home')
      expect(page).to have_content('Items')
      expect(page).to have_content('Merchants')
      expect(page).to have_content('Invoices')
    end

    it 'I can click on new merchant' do
      merchant = Merchant.create(name: 'Tyler')
      visit '/merchants'
      within first('#drop-down') do
        click_on('Create a New Merchant')
        expect(current_path).to eq('/merchants/new')
      end
    end

    it 'I can click on edit merchant' do
      visit '/merchants'
      within first('#drop-down') do
        click_on('Edit a Merchant')
        expect(current_path).to eq('/merchants')
      end
    end

    it 'I can click on view all merchants' do
      visit '/merchants'
      within first('#drop-down') do
        click_on('View All Merchants')
        expect(current_path).to eq('/merchants')
      end
    end
  end
end
