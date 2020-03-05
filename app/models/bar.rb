class Bar < ApplicationRecord
  has_many :tastes
  has_many :shop_bars
  has_many :users, through: :tastes
  has_many :shops, through: :shop_bars
  has_many :bar_reviews, through: :tastes
  validates :name, presence: true
end
