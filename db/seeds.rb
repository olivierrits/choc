# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'faker'

# ==============================================================================

puts "1. seeding the shops to the database"
puts "===================================="

filepath = "db/Seeding_Shops.csv"

csv_options = { col_sep: ';', headers: :first_row }
Time.zone = "Brussels"
CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  a = Shop.create(name: row[0])
  b = Address.create(street: row[1], number: row[2], postcode: row[3], city: row[4], country: row[5])
  a.address = b
  (1..7).each do |day|
    if (day == 1) || (day == 7)
      a.opening_times << OpeningTime.new(day: day, open: false)
    elsif (day == 2)
      a.opening_times << OpeningTime.new(day: day, open: true, opening_hour: ActiveSupport::TimeZone["Brussels"].parse("13:30"), closing_hour: ActiveSupport::TimeZone["Brussels"].parse("18:00"))
    else
      a.opening_times << OpeningTime.new(day: day, open: true, opening_hour: ActiveSupport::TimeZone["Brussels"].parse("8:30"), closing_hour: ActiveSupport::TimeZone["Brussels"].parse("12:00"))
      a.opening_times << OpeningTime.new(day: day, open: true, opening_hour: ActiveSupport::TimeZone["Brussels"].parse("13:30"), closing_hour: ActiveSupport::TimeZone["Brussels"].parse("18:00"))
    end
  end
  a.website = Faker::TvShows::SiliconValley.url
  a.phone_number = Faker::PhoneNumber.phone_number
  a.description = Faker::Restaurant.description
  a.save!
  puts "#{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]}"
end

# ==============================================================================

puts "2.seeding the chocolate bars to the database"
puts "============================================"

filepath = "db/Seeding_Bars.csv"

csv_options = { col_sep: ';', headers: :first_row }
CSV.foreach(filepath, csv_options) do |row|
#  Here, row is an array of columns
  a = Bar.create(name: row[0], brand: row[1], origin: row[2], percentage: row[3], beans: row[4])
  a.save!
  puts "#{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]}"
end

puts "3. seeding the shops-bars database with random associations"
puts "==========================================================="

# ==============================================================================

Bar.all.each do |bar|
  Shop.all.each do |shop|
    a = rand(0..2)
    if a == 1
      shop.bars << bar
    end
  end
end

# ==============================================================================

puts "4. seeding the users to the database"
puts "===================================="

User.destroy_all

i = 0
10.times do
  i += 1
  user = User.new(
    { email:    "user#{i}.test@test.be",
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name })
  user.save!
end

# ==============================================================================

puts "5. seeding the tastes database with random associations"
puts "==========================================================="

Bar.all.each do |bar|
  User.all.each do |user|
    a = rand(0..4)
    if a == 1
      bar.users << user
      taste = Taste.new(bar: bar, user: user)
      b = rand(0..4)
      if b == 1
        taste.favourite = true
      end
    end
  end
end

# ==============================================================================

puts "6. seeding the visits database with random associations"
puts "============================================================"

Shop.all.each do |shop|
  User.all.each do |user|
    a = rand(0..4)
    if a == 1
      shop.users << user
      visit = Visit.new(shop: shop, user: user)
      b = rand(0..4)
      if b == 1
        visit.favourite = true
      end
    end
  end
end

# ==============================================================================

puts "7. seeding the barreviews database with random content"
puts "======================================================"


Taste.all.each do |taste|
  bar_review = BarReview.new(content: Faker::Coffee.notes, rating: rand(1..5))
  bar_review.taste = taste
  bar_review.save!
end

# ==============================================================================

puts "8. seeding the barreviews database with random content"
puts "======================================================"

Visit.all.each do |visit|
  shop_review = ShopReview.new(content: Faker::Restaurant.review, rating: rand(1..5))
  shop_review.visit = visit
  shop_review.save!
end
