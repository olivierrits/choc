class OpeningTime < ApplicationRecord
  belongs_to :shop
  validates :day, inclusion: { in: [ 1, 2, 3, 4, 5, 6, 7 ] }
end
