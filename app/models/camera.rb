class Camera < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, url: true
end
