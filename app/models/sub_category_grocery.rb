class SubCategoryGrocery < ApplicationRecord
  belongs_to :category_grocery
  has_many :groceries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :category_grocery_id, presence: true
end
