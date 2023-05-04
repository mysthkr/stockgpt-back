class SubCategoryGrocery < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :category_id, presence: true
end
