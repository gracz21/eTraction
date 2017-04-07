class Statement < ApplicationRecord
  validates :title, :text, presence: true
end
