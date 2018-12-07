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

ActiveRecord::Schema.define(version: 2018_12_07_104148) do

  create_table "airfares", force: :cascade do |t|
    t.string "title"
    t.string "phrase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_notices", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_realizers", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.text "description"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "value"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandising_videos", force: :cascade do |t|
    t.string "title"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "showcases", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "phrase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors_and_supporters", force: :cascade do |t|
    t.string "image"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_events", force: :cascade do |t|
    t.string "title"
    t.string "days"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_speakers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "delegation"
    t.integer "lot_id"
    t.string "name"
    t.string "cpf"
    t.string "rg"
    t.string "rg_issuing_body"
    t.datetime "birth_date"
    t.integer "gender"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "password_digest"
    t.string "IES_name"
    t.string "IES_city"
    t.string "IES_state"
    t.string "IES_course"
    t.string "IES_period"
    t.string "IES_registration_proof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lot_id"], name: "index_users_on_lot_id"
  end

end
