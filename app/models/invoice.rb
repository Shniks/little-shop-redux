class Invoice < ActiveRecord::Base
  has_many  :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

  def self.total_price
    InvoiceItem.sum("quantity * unit_price")
  end
end
