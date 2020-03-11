class Shop < ApplicationRecord

  geocoded_by :address
  after_validation :geocode
  has_one :address
  has_many :opening_times
  has_many :visits
  has_many :shop_bars
  has_many :users, through: :visits
  has_many :bars, through: :shop_bars
  has_many :shop_reviews, through: :visits
  validates :name, presence: true

  def full_address
    address.to_s
  end
end
