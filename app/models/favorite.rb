class Favorite < ApplicationRecord
  validates :group_id, presence: true
  validates :item_id, presence: true
end
