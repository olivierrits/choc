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

  def status
    @status ||= get_status
  rescue
    "open"
  end

  def status_to_s
    return "Opening soon" if status == "opening_soon"
    return "Open" if status == "open"
    return "Closing soon" if status == "closing_soon"
    return "Closed" if status == "closed"
  end

  def status_class
    return "fas fa-times-circle icon-orange" if status == "opening_soon"
    return "fas fa-check-circle icon-green" if status == "open"
    return "fas fa-check-circle icon-orange" if status == "closing_soon"
    return "fas fa-times-circle icon-red" if status == "closed"
  end

  def get_status(time=DateTime.now)
    time = time.change(day: 1, month: 1, year: 2000).asctime.in_time_zone("UTC")
    tt = today_open_times(time)
    return "opening_soon" if today_open_times.where("opening_hour < :min AND opening_hour > :max", min: time + 30.minutes, max: time).any?
    return "open" if today_open_times.where("opening_hour < :min AND closing_hour > :max", min: time, max: time + 30.minutes).any?
    return "closing_soon" if today_open_times.where("closing_hour < :min AND closing_hour > :max", min: time + 30.minutes, max: time).any?
    return "closed"
  end

  def today_open_times(time=DateTime.now)
    time = time.change(day: 1, month: 1, year: 2000).asctime.in_time_zone("UTC")
    today_open_times = opening_times.where(day: weekday(time), open: true)
  end

  def weekday(day)
    result = (day.wday + 6) % 7
    result.zero? ? 7 : result
  end
end
