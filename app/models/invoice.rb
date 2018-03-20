class Invoice < ActiveRecord::Base
  has_many  :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

  def total_price(id)
    invoice = Invoice.find(id)
    invoiceitems = invoice.invoice_items
    invoiceitems.sum("quantity * unit_price")
  end

  def self.highest_price
    highest_price_item = InvoiceItem.maximum('unit_price')
    InvoiceItem.where(unit_price: highest_price_item)
  end

  def self.lowest_price
    lowest_price_item = InvoiceItem.minimum('unit_price')
    InvoiceItem.where(unit_price: lowest_price_item)
  end

  def self.highest_quantity
    highest_quantity_invoice = InvoiceItem.maximum('quantity')
    InvoiceItem.where(quantity: highest_quantity_invoice).first
  end

  def self.lowest_quantity
    lowest_quantity_invoice = InvoiceItem.minimum('quantity')
    InvoiceItem.where(quantity: lowest_quantity_invoice).first
  end
end
