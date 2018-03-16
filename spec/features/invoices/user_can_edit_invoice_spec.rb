describe 'User edits invoices' do
  before(:each) do
    Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')
    Invoice.create(customer_id: 18, merchant_id: 28, status: 'shipped')
  end

  describe 'User can edit an invoice' do
    it 'User can edit multiple invoice fields' do
      visit '/invoices/1/edit'
      fill_in('invoice[customer_id]', with: 108)
      fill_in('invoice[merchant_id]', with: 88)
      fill_in('invoice[status]', with: 'sold')
      click_button 'Submit'

      expect(page).to have_content(10)
      expect(page).to have_content(108)
      expect(page).to have_content(88)
      expect(page).to have_content('sold')
    end
  end
end
