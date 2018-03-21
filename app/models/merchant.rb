class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  validates :name, presence: true

  def total_items
    items.count
  end

  def average_price
    items.average(:unit_price)
  end

  def total_sales
    items.sum(:unit_price)
  end

  def self.max_price
    Item.maximum("unit_price")
  end

  def self.find_item_for_max_price
    Item.find_by(unit_price: max_price)
  end

  def self.find_merchant_id_from_price
    find_item_for_max_price.merchant_id
  end

  def self.merchant_with_highest_price_item
    merchant = Merchant.find(find_merchant_id_from_price)
  end

  def self.merchants_with_quantity
    merchants = Merchant.all
    merchants.map do |merchant|
       { "name" => merchant.name, "count" => merchant.items.count,
         "id" => merchant.id }
    end
  end

  def self.merchant_with_highest_quantity
    merchants_with_quantity.sort_by { |k| k["count"]}.last
  end
end
