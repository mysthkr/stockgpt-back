class Cart < ApplicationRecord
  validates :criteria, presence: true, length: { maximum: 5 }
  validates :price, length: { maximum: 11 },  if: :price?
end
