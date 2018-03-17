class Item < ActiveRecord::Base

belongs_to :merchant
belongs_to :invoice_item  
validates_presence_of :name
validates_presence_of :description
validates_presence_of :unit_price

  def self.average_price
    (average(:unit_price).to_f / 100).round(2)
  end

  def self.total_items
    Item.all.count
  end


end
