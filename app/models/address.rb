class Address < ApplicationRecord
  belongs_to :shop

  def to_s
    "#{street} #{number}, #{postcode} #{city}, #{country}"
  end
end
