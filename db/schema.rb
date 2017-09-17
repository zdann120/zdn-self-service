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

ActiveRecord::Schema.define(version: 20170917044055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.string "nickname"
    t.string "line1"
    t.string "line2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "verification_code"
    t.boolean "verified", default: false
    t.jsonb "verification_result"
    t.index ["token"], name: "index_addresses_on_token", unique: true
    t.index ["user_id"], name: "index_addresses_on_user_id"
    t.index ["verification_code"], name: "index_addresses_on_verification_code", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id"
    t.boolean "canceled"
    t.string "description"
    t.datetime "starts_at"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_appointments_on_token", unique: true
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.string "identifier"
    t.string "token"
    t.text "description"
    t.date "send_date"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_code"
    t.index ["address_id"], name: "index_invoices_on_address_id"
    t.index ["token"], name: "index_invoices_on_token", unique: true
    t.index ["unique_code"], name: "index_invoices_on_unique_code", unique: true
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.string "itemable_type"
    t.bigint "itemable_id"
    t.string "title"
    t.integer "quantity"
    t.string "unit_of_measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_price_cents"
    t.index ["itemable_type", "itemable_id"], name: "index_line_items_on_itemable_type_and_itemable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "default_address_id"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "appointments", "users"
  add_foreign_key "invoices", "addresses"
  add_foreign_key "invoices", "users"
end
