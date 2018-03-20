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
    InvoiceItem.where(quantity: lowest_quantity_invoice).last
  end

  def self.status_pending
    pending_status = Invoice.where(status: 'pending').count.to_f
    ( (pending_status / Invoice.all.count) * 100 ).round
  end

  def self.status_shipped
    shipped_status = Invoice.where(status: 'shipped').count.to_f
    ( (shipped_status / Invoice.all.count) * 100 ).round
  end

  def self.status_returned
    100 - status_pending - status_shipped
  end
end
