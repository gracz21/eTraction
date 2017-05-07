class Message < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 140 }
  validates :user, presence: true
end