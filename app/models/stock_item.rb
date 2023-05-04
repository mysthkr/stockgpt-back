class StockItem < ApplicationRecord
  validates :group_id, presence: true
  validates :criteria, presence: true, length: { maximum: 5 }
  validates :item_id, presence: true
  validates :alarm_date, presence: true
  validates :price, length: { maximum: 11 }, numericality: { greater_than_or_equal_to: 1 } ,  if: :price?
  validates :quantity, length: { maximum: 5 }, numericality: { greater_than_or_equal_to: 1 } ,  if: :quantity?
end
