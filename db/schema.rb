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

ActiveRecord::Schema.define(version: 2019_08_30_075928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cancels", force: :cascade do |t|
    t.string "code"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claims", force: :cascade do |t|
    t.string "train_id"
    t.string "location_from"
    t.string "location_to"
    t.string "delay_duration"
    t.string "reason_for_delay"
    t.bigint "ticket_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "departure_date"
    t.string "departure_time"
    t.index ["ticket_id"], name: "index_claims_on_ticket_id"
    t.index ["user_id"], name: "index_claims_on_user_id"
  end

  create_table "photo_cards", force: :cascade do |t|
    t.string "photo"
    t.string "card_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photo_cards_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ticket_number"
    t.float "price"
    t.date "valid_from"
    t.date "expiry_date"
    t.string "ticket_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address"
    t.string "postcode"
    t.string "city"
    t.string "title"
    t.string "sort_code"
    t.string "account_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "claims", "tickets"
  add_foreign_key "claims", "users"
  add_foreign_key "photo_cards", "users"
  add_foreign_key "tickets", "users"
end
