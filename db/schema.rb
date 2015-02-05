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

ActiveRecord::Schema.define(version: 20150128222759) do

  create_table "guides", force: true do |t|
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "specialty"
    t.float    "rate"
    t.boolean  "availability", default: false
    t.string   "sun_avail"
    t.string   "mon_avail"
    t.string   "tues_avail"
    t.string   "wed_avail"
    t.string   "thurs_avail"
    t.string   "fri_avail"
    t.string   "sat_avail"
  end

  add_index "guides", ["user_id"], name: "index_guides_on_user_id"

  create_table "reviews", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "guide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
  end

  add_index "reviews", ["guide_id", "created_at"], name: "index_reviews_on_guide_id_and_created_at"
  add_index "reviews", ["guide_id"], name: "index_reviews_on_guide_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "phone_number"
    t.integer  "age"
    t.text     "profile",         limit: 255
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
