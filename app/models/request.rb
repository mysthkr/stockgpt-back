class Request < ApplicationRecord
  validates :request_type, presence: true, length: { maximum: 50 }
  validates :request_name, presence: true, length: { maximum: 50 }
end
