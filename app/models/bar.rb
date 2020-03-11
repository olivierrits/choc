class Bar < ApplicationRecord
  has_many :tastes, dependent: :destroy
  has_many :shop_bars, dependent: :destroy
  has_many :users, through: :tastes
  has_many :shops, through: :shop_bars
  has_many :bar_reviews, through: :tastes, dependent: :destroy
  validates :name, presence: true

  def average_rating
    @average_rating ||= bar_reviews.average(:rating).round
  end
end
