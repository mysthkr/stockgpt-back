class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :criteria, presence: true, length: { maximum: 5 }
end
