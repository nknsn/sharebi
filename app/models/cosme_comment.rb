class CosmeComment < ApplicationRecord

  belongs_to :user
  belongs_to :cosmetic

  validates :comment, presence: true

end
