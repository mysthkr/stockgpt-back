class Cart < ApplicationRecord
  belongs_to :group
  belongs_to :item

  # delete "presence: true," from criteria
  validates :criteria,  length: { maximum: 5 }
  validates :price, length: { maximum: 11 },  if: :price?
end
