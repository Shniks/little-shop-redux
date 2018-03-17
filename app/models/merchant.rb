class Merchant < ActiveRecord::Base
  has_many :items
  validates :name, presence: true

  def self.total_items(id)
    merchant = Merchant.find(id)
    merchant.items.count
  end
end
