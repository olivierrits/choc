class Shop < ApplicationRecord
  has_one :address
  has_many :opening_times
  has_many :users, through: :shop_users,
  has_many :bars, through: :shop_bars,
  has_many :shop_reviews, through: :shop_users,
  has_many :visits, through: :shop_users,
  validates :name, presence: true
end
