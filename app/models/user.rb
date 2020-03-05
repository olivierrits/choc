class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :visits
  has_many :tastes
  has_many :shops, through: :visits
  has_many :bars, through: :tastes
  has_many :shop_reviews, through: :visits
  has_many :bar_reviews, through: :tastes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
