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

ActiveRecord::Schema.define(version: 2018_12_12_104032) do

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
    t.string "document"
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

  create_table "event_realizers_titles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ies", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lots", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "therm"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandising_videos", force: :cascade do |t|
    t.string "title"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "lot_id"
    t.string "name"
    t.decimal "value"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lot_id"], name: "index_packages_on_lot_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "payment_id"
    t.decimal "value"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_parcels_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "package_id"
    t.integer "payment_option"
    t.integer "parceling_option"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_payments_on_package_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "showcases", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "phrase"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors_and_supporters", force: :cascade do |t|
    t.string "image"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors_and_supporters_titles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_events", force: :cascade do |t|
    t.string "title"
    t.string "days"
    t.string "mounth"
    t.string "locality"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_speakers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "delegation"
    t.string "name"
    t.string "telephone"
    t.string "cpf"
    t.string "rg"
    t.string "rg_issuing_body"
    t.datetime "birth_date"
    t.integer "gender"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "password_digest"
    t.string "image"
    t.boolean "admin", default: false
    t.string "course"
    t.string "period"
    t.string "registration_proof"
    t.boolean "subscribe_status", default: false
    t.boolean "therm_acepted", default: false
    t.integer "IES_id"
    t.integer "lot_id"
    t.integer "package"
    t.integer "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
