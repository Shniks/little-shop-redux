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

  def self.total_sales(id)
    merchant = Merchant.find(id)
    merchant.items.total_price
  end

  def self.max_price
    Item.maximum("unit_price")
  end

  def self.find_item
    Item.find_by(unit_price: max_price)
  end

  def self.find_merchant_id
    find_item.merchant_id
  end

  def self.merchant_with_highest_price_item
    merchant = Merchant.find(find_merchant_id)
    merchant.name
  end
end
