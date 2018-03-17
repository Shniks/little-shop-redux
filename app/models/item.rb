class Item < ActiveRecord::Base
validates_presence_of :name
validates_presence_of :description
validates_presence_of :unit_price

  def self.average_price
    average(:unit_price).to_f.round(2)
  end

  def self.total_items
    Item.all.count
  end


end
