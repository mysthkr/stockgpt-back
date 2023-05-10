class Grocery < ApplicationRecord
  belongs_to :category_grocery

  validates :item_id, presence: true
  validates :sub_category_grocery_id, presence: true
  validates :category_grocery_id, presence: true
end
