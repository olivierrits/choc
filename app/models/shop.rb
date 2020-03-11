class Shop < ApplicationRecord

  geocoded_by :address
  after_validation :geocode
  has_one :address
  has_many :opening_times, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :shop_bars, dependent: :destroy
  has_many :users, through: :visits, dependent: :destroy
  has_many :bars, through: :shop_bars, dependent: :destroy
  has_many :shop_reviews, through: :visits, dependent: :destroy
  validates :name, presence: true

  def full_address
    address.to_s
  end
end
