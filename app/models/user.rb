class User < ApplicationRecord
  validates :device_id, :username, presence: true, uniqueness: true
end
