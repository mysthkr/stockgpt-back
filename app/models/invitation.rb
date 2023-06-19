class Invitation < ApplicationRecord
  validates :group_id, uniqueness: { scope: :user_id }
  belongs_to :group
  belongs_to :user

  validates :group_id, presence: true
  validates :user_id, presence: true
end
