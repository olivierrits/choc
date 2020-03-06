class ShopReview < ApplicationRecord
  belongs_to :visit
  belongs_to :user
  belongs_to :shop
end
