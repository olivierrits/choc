class OpeningTime < ApplicationRecord
  belongs_to :shop
  validates :day, inclusion: { in: [ 1, 2, 3, 4, 5, 6, 7 ] }

  def actual_day
    case day
    when 1
      'Monday'
    when 2
      'Tuesday'
    when 3
      'Wednesday'
    when 4
      'Thursday'
    when 5
      'Friday'
    when 6
      'Saturday'
    when 7
      'Sunday'
    end
  end
end
