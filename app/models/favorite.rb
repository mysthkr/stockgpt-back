class Favorite < ApplicationRecord
  belongs_to :group
  belongs_to :item

  validates :group_id, presence: true
  validates :item_id, presence: true
  validates :group_id, uniqueness: { scope: :item_id }
end
