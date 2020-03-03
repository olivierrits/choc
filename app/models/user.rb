class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :shops, through: :shop_users
  has_many :bars, through: :bar_users
  has_many :bar_reviews, through: :bar_users
  has_many :tastes, through: :bar_users
  has_many :shop_reviews, through: :shop_users
  has_many :visits, through: :shop_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
