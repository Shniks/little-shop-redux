describe 'Merchant Dashboard' do
  context 'I can visit the merchant dashboard' do
    it 'I can see merchants on the page' do
      merchant_1 = Merchant.create(name: 'Tyler')
      merchant_2 = Merchant.create(name: 'Nikhil')
      merchant_3 = Merchant.create(name: 'Kyle')
      merchant_4 = Merchant.create(name: 'Ian')
      merchant_5 = Merchant.create(name: 'Ali')
      visit '/merchants-dashboard'

      expect(page).to have_content('Tyler')
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content('Nikhil')
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content('Kyle')
      expect(page).to have_content(merchant_3.name)
      expect(page).to have_content('Ian')
      expect(page).to have_content(merchant_4.name)
      expect(page).to have_content('Ali')
      expect(page).to have_content(merchant_5.name)
    end
  end
end
