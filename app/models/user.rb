class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :visits, dependent: :destroy
  has_many :tastes, dependent: :destroy
  has_many :shops, through: :visits, dependent: :destroy
  has_many :bars, through: :tastes, dependent: :destroy
  has_many :shop_reviews, through: :visits, dependent: :destroy
  has_many :bar_reviews, through: :tastes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
