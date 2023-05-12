class CategoryProduct < ApplicationRecord
  has_many :sub_category_products, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
