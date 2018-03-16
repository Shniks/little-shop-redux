require 'csv'
require_relative '../app/models/merchant.rb'
require_relative '../app/models/invoice.rb'
require_relative '../app/models/item.rb'
require_relative '../app/models/invoice_item.rb'


CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Merchant.create(row.to_hash)
end

CSV.foreach('data/invoices.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Invoice.create(row.to_hash)
end

CSV.foreach('data/items.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Item.create(id:          row[:id],
              name:        row[:name],
              description: row[:description],
              unit_price:  row[:unit_price],
              merchant_id: row[:merchant_id],
              created_at:  row[:created_at],
              updated_at:  row[:updated_at],
              image:       "../public/images/ruby.png")
end

CSV.foreach('data/invoice_items.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  InvoiceItem.create(row.to_hash)
end
