describe 'user can delete invoices' do
  before(:each) do
    Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')
    Invoice.create(customer_id: 18, merchant_id: 28, status: 'shipped')
  end

  # after(:each) do
  #   DatabaseCleaner.clean
  # end

  describe 'Delete Invoice' do
    it 'user deletes an invoice' do
      visit '/invoices/1'
      click_button 'DELETE'

      expect(page).to_not have_content('pending')
    end
  end
end
