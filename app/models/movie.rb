class Movie < ApplicationRecord
  validates :title, :genre, :length, :poster, :filename, presence: true

  mount_uploader :poster, MoviePosterUploader
  mount_uploader :filename, MovieFileUploader
end
