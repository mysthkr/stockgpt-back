class Item < ApplicationRecord
  has_one :product, dependent: :destroy
  has_one :grocery, dependent: :destroy
  has_many :stock_items, dependent: :destroy
  has_many :to_buy_lists, dependent: :destroy
  has_many :cart, dependent: :destroy
  has_many :criteria_days, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :criteria, presence: true, length: { maximum: 5 }
end
