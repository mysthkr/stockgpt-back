class Item < ApplicationRecord
  has_one :product, dependent: :destroy
  has_one :grocery, dependent: :destroy
  has_many :stock_items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :criteria, presence: true, length: { maximum: 5 }
end
