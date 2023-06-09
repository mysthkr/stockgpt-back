class Grocery < ApplicationRecord
  belongs_to :category_grocery
  belongs_to :item
  belongs_to :sub_category_grocery

  validates :item_id, presence: true
  validates :sub_category_grocery_id, presence: true
  validates :category_grocery_id, presence: true

  scope :search_word,  -> (word){ Grocery.joins(:item).where("items.name LIKE ?", "%#{word}%")
  .select('groceries.*, items.name as item_name') }
end
