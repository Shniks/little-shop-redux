describe 'User edits invoices' do
  describe 'User can edit an invoice' do
    it 'User can edit multiple invoice fields' do
      invoice = Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')

      visit "/invoices/#{invoice.id}/edit"

      expect(page).to have_content("Invoice: #{invoice.id}")
    end
  end
end
