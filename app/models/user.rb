class User < ApplicationRecord
  has_many :messages

  validates :device_id, :username, presence: true, uniqueness: true

  rails_admin do
    list do
      exclude_fields :messages
    end
  end

  def name
    username
  end
end
