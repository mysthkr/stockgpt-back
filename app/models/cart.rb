class Cart < ApplicationRecord
  belongs_to :group
  belongs_to :item

  validates :criteria, presence: true, length: { maximum: 5 }
  validates :price, length: { maximum: 11 },  if: :price?
end
