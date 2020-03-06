class BarReview < ApplicationRecord
  belongs_to :taste
  belongs_to :user
  belongs_to :bar
end
