class SubCategoryProduct < ApplicationRecord
  belongs_to :category_product

  validates :name, presence: true, length: { maximum: 50 }
  validates :category_product_id, presence: true
end
