# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_18_214030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurant_images", force: :cascade do |t|
    t.string "image_url"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_images_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false, comment: "店名"
    t.string "nearest_station", comment: "最寄り駅"
    t.integer "budget", comment: "予算"
    t.string "category", comment: "カテゴリ"
    t.string "postal_code", null: false, comment: "郵便番号"
    t.string "address", null: false, comment: "住所文字列"
    t.string "city", null: false, comment: "市町村"
    t.string "district", comment: "地区"
    t.float "latitude", null: false, comment: "緯度"
    t.float "longitude", null: false, comment: "経度"
    t.string "phone_number", null: false, comment: "電話番号"
    t.string "business_hours", comment: "営業時間"
    t.text "description", comment: "説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "restaurant_images", "restaurants"
end
