describe 'User edits invoices' do
  describe 'User can edit an invoice' do
    it 'User can edit multiple invoice fields' do
      invoice = Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')

      visit "/invoices/#{invoice.id}/edit"
      fill_in('invoice[customer_id]', with: 111)
      fill_in('invoice[merchant_id]', with: 222)
      fill_in('invoice[status]', with: 'sold')
      click_button 'Submit'

      expect(page).to have_content("Invoice ID: #{invoice.id}")
      expect(page).to have_content('sold')
    end
  end
end
