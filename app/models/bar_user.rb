class BarUser < ApplicationRecord
  belongs_to :bar
  belongs_to :user
  has_one :bar_review
  has_one :taste
end
