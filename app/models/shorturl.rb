class Shorturl < ApplicationRecord
  validates :original_url, presence: true
end
