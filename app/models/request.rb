class Request < ApplicationRecord
  belongs_to :user
  validates :request_type, presence: true, length: { maximum: 50 }
  validates :request_name, presence: true, length: { maximum: 50 }
end
