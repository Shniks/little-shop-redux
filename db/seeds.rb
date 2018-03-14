require 'csv'
require_relative '../app/models/merchant.rb'


CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol, converters: :numeric) do |row|
  Merchant.create(row.to_hash)
end
