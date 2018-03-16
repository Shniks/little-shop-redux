describe 'As a user' do
  context 'I visit the merchant index' do
    it 'I see the header' do
      merchant = Merchant.create(name: "Tyler")
      visit '/merchants'

      expect(page).to have_content(merchant.name)
    end
  end
end
