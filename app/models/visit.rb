class Visit < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_one :shop_review
end
