class Exercise < ApplicationRecord
  belongs_to :user
  attribute :date, :date, default: Date.today.to_s
end
