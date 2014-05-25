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

ActiveRecord::Schema.define(version: 20140525231637) do

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
  end

  create_table "biografijas", force: true do |t|
    t.string   "pozicija"
    t.string   "poslodavac"
    t.string   "lokacija"
    t.string   "pocetakRada"
    t.string   "drzava"
    t.string   "zavrsetakRada"
    t.string   "preporuke"
    t.string   "opisPosla"
    t.string   "jezik"
    t.string   "strucnaSprema"
    t.string   "stepen"
    t.string   "obrazovnaUstanova"
    t.string   "titula"
    t.string   "smjer"
    t.string   "opis"
    t.string   "pocetak"
    t.string   "vjestina"
    t.string   "zavrsetak"
    t.string   "komentar"
    t.string   "stepenObrazovanja"
    t.string   "kompetencije"
    t.string   "ostalo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "naziv"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  create_table "jeziks", force: true do |t|
    t.string   "jezik"
    t.string   "stepen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kategorijas", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "obrazovanjes", force: true do |t|
    t.string   "obrazovnaUstanova"
    t.string   "smjer"
    t.string   "titula"
    t.string   "opis"
    t.string   "pocetak"
    t.string   "zavrsetak"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "contents"
    t.string   "author"
    t.datetime "post_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "radno_iskustvos", force: true do |t|
    t.string   "pozicija"
    t.string   "poslodavac"
    t.string   "lokacija"
    t.string   "drzava"
    t.string   "pocetakRada"
    t.string   "zavrsetakRada"
    t.string   "opisPosla"
    t.string   "preporuke"
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

  create_table "vjestines", force: true do |t|
    t.string   "vjestina"
    t.string   "stepenPoznavanja"
    t.string   "komentar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
