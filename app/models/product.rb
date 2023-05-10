class Product < ApplicationRecord
  belongs_to :category_product
  belongs_to :item
  belongs_to :sub_category_product
  belongs_to :maker
  
  validates :item_id, presence: true
  validates :sub_category_product_id, presence: true
  validates :category_product_id, presence: true
  validates :maker_id, presence: true
end
