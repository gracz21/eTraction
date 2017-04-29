class User < ApplicationRecord
  has_many :messages

  validates :device_id, :username, presence: true, uniqueness: true
end
