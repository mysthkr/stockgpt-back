class CategoryGrocery < ApplicationRecord
  has_many :sub_category_groceries, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
