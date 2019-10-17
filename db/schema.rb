# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20191014134639) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "show_id",          limit: 4
    t.integer  "user_id",          limit: 4
    t.integer  "ticket_booked",    limit: 4
    t.string   "payment_method",   limit: 255
    t.integer  "total_amount",     limit: 4
    t.datetime "booking_datetime"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "bookings", ["show_id"], name: "fk_rails_f6de0bbe34", using: :btree
  add_index "bookings", ["user_id"], name: "fk_rails_ef0571f117", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "actor",        limit: 255
    t.string   "director",     limit: 255
    t.date     "release_date"
    t.integer  "rating",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shows", force: :cascade do |t|
    t.integer  "movie_id",         limit: 4
    t.string   "venue",            limit: 255
    t.datetime "showtime"
    t.integer  "ticket_available", limit: 4
    t.integer  "price",            limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "shows", ["movie_id"], name: "fk_rails_9e13f841bc", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.integer  "age",             limit: 4
    t.string   "gender",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "bookings", "shows"
  add_foreign_key "bookings", "users"
  add_foreign_key "shows", "movies"
end
