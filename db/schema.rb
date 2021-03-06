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

ActiveRecord::Schema.define(version: 20140627145134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advartisments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "published"
    t.date     "expire"
    t.string   "location"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employer"
  end

  create_table "cvs", force: true do |t|
    t.string   "naslov"
    t.string   "dodatno"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "radnoIskustvo"
    t.string   "strucnaSprema"
    t.string   "obrazovanje"
    t.string   "jezici"
    t.string   "vjestine"
    t.string   "ostaleInformacije"
    t.integer  "user_id"
  end

  add_index "cvs", ["user_id"], name: "index_cvs_on_user_id", using: :btree

  create_table "employers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "location"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kategorijas", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.string   "oglas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "kategorija_id"
    t.string   "kategorija"
  end

  add_index "notifications", ["kategorija_id"], name: "index_notifications_on_kategorija_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "contents"
    t.string   "author"
    t.datetime "post_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.string   "lastname"
    t.string   "address"
    t.string   "phone"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
