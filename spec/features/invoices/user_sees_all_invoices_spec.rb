describe 'User can see single and multiple invoices' do
  before(:each) do
    @invoice = Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')
    @invoice2 = Invoice.create(customer_id: 18, merchant_id: 28, status: 'shipped')
  end

  describe 'User can see all invoices' do
    it 'User sees invoices' do
      visit '/invoices'
      expect(page).to have_content('pending')
      expect(page).to have_content('shipped')
    end
  end

  describe 'User can see a single invoice' do
    it 'User sees single invoice' do
      visit "/invoices/#{@invoice.id}"
      expect(page).to have_content('pending')
    end

    it 'User sees another invoice' do
      visit "/invoices/#{@invoice2.id}"
      expect(page).to have_content('shipped')
    end
  end
end
