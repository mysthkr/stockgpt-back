class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :trackable
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  # after_create :set_group_id_to_primary_key
  has_one :profile, dependent: :destroy
  # has_many :users, dependent: :destroy
  has_many :invitations, dependent: :destroy
  belongs_to :group

  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  before_validation { email.downcase! }
  validates :encrypted_password, length: { minimum: 4 }

  private

  def set_group_id_to_primary_key
    update_column(:group_id, self.id)
  end
end
