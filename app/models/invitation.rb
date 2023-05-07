class Invitation < ApplicationRecord
  validates :group_id, presence: true
  validates :user_id, presence: true
end
