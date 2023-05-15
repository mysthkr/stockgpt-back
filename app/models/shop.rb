class Shop < ApplicationRecord
  has_many :stock_items, dependent: :destroy

  validates :name, length: { maximum: 50 }, presence: true
  validates :prefecture, presence: true
end
