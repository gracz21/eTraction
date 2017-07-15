class UserVideo < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :title, presence: true, length: { maximum: 50 }
  validates :user, :video, presence: true

  mount_uploader :video, UserVideoUploader
end
