class Invoice < ActiveRecord::Base
  has_many  :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

  def self.total_price
    InvoiceItem.sum("quantity * unit_price")
  end

  def self.highest_price
    highest_price_item = InvoiceItem.maximum('unit_price')
    InvoiceItem.where(unit_price: highest_price_item)
  end

  def self.lowest_price
    lowest_price_item = InvoiceItem.minimum('unit_price')
    InvoiceItem.where(unit_price: lowest_price_item)
  end

end
