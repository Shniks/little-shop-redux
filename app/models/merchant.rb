class Merchant < ActiveRecord::Base
  has_many :items
  validates :name, presence: true

  def self.total_items(id)
    merchant = Merchant.find(id)
    merchant.items.count
  end

  def self.average_price(id)
    merchant = Merchant.find(id)
    merchant.items.average(:unit_price)
  end

  
end
