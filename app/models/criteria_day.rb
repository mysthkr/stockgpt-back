class CriteriaDay < ApplicationRecord
  validates :group_id, presence: true
  validates :criteria, presence: true, length: { maximum: 5 }
  validates :item_id, presence: true
end
