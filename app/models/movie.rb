class Movie < ApplicationRecord
  validates :title, :genre, :length, :poster, :filename, presence: true
end
