class SubCategoryGrocery < ApplicationRecord
  belongs_to :category_grocery

  validates :name, presence: true, length: { maximum: 50 }
  validates :category_grocery_id, presence: true
end
