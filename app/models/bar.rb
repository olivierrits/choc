class Bar < ApplicationRecord
  has_many :bar_users
  has_many :shop_bars
  has_many :users, through: :bar_users
  has_many :shops, through: :shop_bars
  has_many :bar_reviews, through: :bar_users
  has_many :tastes, through: :bar_users
  validates :name, presence: true
end
