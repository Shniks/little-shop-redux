class Item < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :invoice_item
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
end
