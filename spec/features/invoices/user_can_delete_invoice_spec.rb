describe 'User can delete invoices' do
  before(:each) do
    Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')
  end

  describe 'User can delete an invoice' do
    it 'User deletes an invoice' do
      invoice = Invoice.create(customer_id: 18, merchant_id: 28, status: 'shipped')
      visit "/invoices/#{invoice.id}"
      click_button 'DELETE'

      expect(page).to_not have_content('pending')
    end
  end
end
