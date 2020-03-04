# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

filepath = "db/Seeding_Shops.csv"

csv_options = { col_sep: ';', headers: :first_row }
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
  a.save!
  puts "#{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]} | #{row[5]}"
end

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath    = 'beers.csv'

# CSV.foreach(filepath, csv_options) do |row|
#   puts "#{row['Name']}, a #{row['Appearance']} beer from #{row['Origin']}"
# end

filepath = "db/Seeding_Bars.csv"

csv_options = { col_sep: ';', headers: :first_row }
CSV.foreach(filepath, csv_options) do |row|
#  Here, row is an array of columns
  a = Bar.create(name: row[0], brand: row[1], origin: row[2], percentage: row[3], beans: row[4])
  a.save!
  puts "#{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} | #{row[4]}"
end

Bar.all.each do |bar|
  Shop.all.each do |shop|
    a = rand(0..1)
    if a == 1
      shop.bars << bar
    end
  end
end

