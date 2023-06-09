class Group < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :stock_items, dependent: :destroy
  has_many :to_buy_lists, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :criteria_days, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :invitations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
