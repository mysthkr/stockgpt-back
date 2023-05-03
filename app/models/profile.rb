class Profile < ApplicationRecord
  after_create :set_nickname_if_blank
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :nickname, length: { maximum: 50 }
  validates :roommate_number,  length: { maximum: 2 }

  private

  def set_nickname_if_blank
    if self.nickname.blank?
      update_column(:nickname, self.name)
    end
  end
end
