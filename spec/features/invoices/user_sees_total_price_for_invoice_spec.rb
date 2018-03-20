require './app/models/invoice.rb'
require './app/models/item.rb'


RSpec.describe "User sees total price for an invoice" do
  it 'It lists the total price for an invoice' do
    invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 8, status: 'pending')
    item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 8)
    invoice_item_1 = invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
    item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 8)
    invoice_item_2 = invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)
    visit "/invoices/#{invoice_1.id}"

    expect(page).to have_content(invoice_1.total_price(invoice_1.id))
    expect(page).to have_content(417582.0)
  end
end
