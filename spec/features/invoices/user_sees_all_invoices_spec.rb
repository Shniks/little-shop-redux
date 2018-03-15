describe 'user sees single and multiple invoices' do
  before(:each) do
    Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')
    Invoice.create(customer_id: 18, merchant_id: 28, status: 'shipped')
  end

  # after(:all) do
  #   DatabaseCleaner.clean
  # end

  describe 'Shows All Invoices' do
    it 'user sees invoices' do
      visit '/invoices'
      expect(page).to have_content('pending')
      expect(page).to have_content('shipped')
    end
  end

  describe 'Shows Single Invoice' do
    it 'user sees single invoice' do
      visit '/invoices/1'
      expect(page).to have_content('pending')
    end

    it 'user sees another invoice' do
      visit '/invoices/2'
      expect(page).to have_content('shipped')
    end
  end
end
