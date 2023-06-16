class Product < ApplicationRecord
  belongs_to :category_product
  belongs_to :item
  belongs_to :sub_category_product
  belongs_to :maker, optional: true
  
  validates :item_id, presence: true
  validates :sub_category_product_id, presence: true
  validates :category_product_id, presence: true
  # validates :maker_id, presence: true

  scope :search_product_word,  -> (word){ Product.joins(:item).where("items.name LIKE ?", "%#{word}%")
  .select('products.*, items.name as item_name') }
end
