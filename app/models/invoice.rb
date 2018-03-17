class Invoice < ActiveRecord::Base
  has_many  :invoice_items
  validates :customer_id, presence: true
  validates :merchant_id, presence: true
  validates :status, presence: true

end
