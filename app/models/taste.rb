class Taste < ApplicationRecord
  belongs_to :bar
  belongs_to :user
  has_one :bar_review
end
