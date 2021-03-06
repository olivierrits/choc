# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_10_203612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.integer "postcode"
    t.string "street"
    t.integer "number"
    t.decimal "longitude"
    t.decimal "latitude"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_addresses_on_shop_id"
  end

  create_table "bar_reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taste_id"
    t.index ["taste_id"], name: "index_bar_reviews_on_taste_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "beans"
    t.integer "percentage"
    t.string "origin"
    t.integer "price_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "production"
    t.string "ingredients"
    t.string "description"
  end

  create_table "opening_times", force: :cascade do |t|
    t.time "opening_hour"
    t.time "closing_hour"
    t.integer "day"
    t.boolean "open"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_opening_times_on_shop_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "content"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_bars", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_shop_bars_on_bar_id"
    t.index ["shop_id"], name: "index_shop_bars_on_shop_id"
  end

  create_table "shop_reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_id"
    t.index ["visit_id"], name: "index_shop_reviews_on_visit_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.text "description"
    t.string "phone_number"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "tastes", force: :cascade do |t|
    t.bigint "bar_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favourite", default: false
    t.integer "counter", default: 1
    t.index ["bar_id"], name: "index_tastes_on_bar_id"
    t.index ["user_id"], name: "index_tastes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favourite", default: false
    t.integer "counter", default: 1
    t.index ["shop_id"], name: "index_visits_on_shop_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "addresses", "shops"
  add_foreign_key "bar_reviews", "tastes"
  add_foreign_key "opening_times", "shops"
  add_foreign_key "shop_bars", "bars"
  add_foreign_key "shop_bars", "shops"
  add_foreign_key "shop_reviews", "visits"
  add_foreign_key "tastes", "bars"
  add_foreign_key "tastes", "users"
  add_foreign_key "visits", "shops"
  add_foreign_key "visits", "users"
end
