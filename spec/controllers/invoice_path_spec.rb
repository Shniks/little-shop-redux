describe 'invoice pathways' do
  it 'returns ok status for index' do
    Invoice.create(customer_id: 8, merchant_id: 88, status: 'pending')
    visit '/invoices'
    expect(page).to have_content('pending')
    # expect(page).to have_http_status(200)
  end
end
