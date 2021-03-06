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

ActiveRecord::Schema.define(version: 2019_11_04_181643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calorie_goals", force: :cascade do |t|
    t.float "calories"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_calorie_goals_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.date "entry_date", default: -> { "now()" }
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "entry_foods", force: :cascade do |t|
    t.float "quantity", default: 1.0
    t.bigint "food_id"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entry_foods_on_entry_id"
    t.index ["food_id"], name: "index_entry_foods_on_food_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "calories"
    t.string "portion_size"
    t.text "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calorie_goals", "users"
  add_foreign_key "entries", "users"
  add_foreign_key "entry_foods", "entries"
  add_foreign_key "entry_foods", "foods"
  add_foreign_key "foods", "users"
end
