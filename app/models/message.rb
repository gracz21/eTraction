class Message < ApplicationRecord
  validates :text, presence: true, length: { maximum: 140 }
end
