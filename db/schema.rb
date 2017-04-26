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

ActiveRecord::Schema.define(version: 20170426140901) do

  create_table "aimages", force: :cascade do |t|
    t.text     "url"
    t.integer  "awsub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["awsub_id"], name: "index_aimages_on_awsub_id"
  end

  create_table "awsubs", force: :cascade do |t|
    t.string   "title"
    t.text     "sinop"
    t.text     "asmall"
    t.text     "amedium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "limages", force: :cascade do |t|
    t.text     "url"
    t.integer  "same_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["same_id"], name: "index_limages_on_same_id"
  end

  create_table "melodies", force: :cascade do |t|
    t.string   "mtitle"
    t.text     "msinop"
    t.text     "msmall"
    t.text     "mmedium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mimages", force: :cascade do |t|
    t.text     "url"
    t.integer  "melody_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["melody_id"], name: "index_mimages_on_melody_id"
  end

  create_table "mistreams", force: :cascade do |t|
    t.text     "url"
    t.integer  "melody_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["melody_id"], name: "index_mistreams_on_melody_id"
  end

  create_table "movieus", force: :cascade do |t|
    t.string   "title"
    t.text     "gstream"
    t.text     "nstream"
    t.text     "lstream"
    t.text     "mstream"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mstreams", force: :cascade do |t|
    t.text     "url"
    t.integer  "movieu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movieu_id"], name: "index_mstreams_on_movieu_id"
  end

  create_table "oimages", force: :cascade do |t|
    t.text     "url"
    t.integer  "oploverz_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["oploverz_id"], name: "index_oimages_on_oploverz_id"
  end

  create_table "oploverzs", force: :cascade do |t|
    t.string   "title"
    t.text     "sinops"
    t.text     "small"
    t.text     "medium"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "visit_count", default: 0, null: false
  end

  create_table "ostreams", force: :cascade do |t|
    t.text     "link"
    t.integer  "oploverz_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["oploverz_id"], name: "index_ostreams_on_oploverz_id"
  end

  create_table "sames", force: :cascade do |t|
    t.string   "title"
    t.text     "lsmall1"
    t.text     "lsmall2"
    t.text     "lmedium1"
    t.text     "lmedium2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timages", force: :cascade do |t|
    t.text     "url"
    t.integer  "tonan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tonan_id"], name: "index_timages_on_tonan_id"
  end

  create_table "tonans", force: :cascade do |t|
    t.string   "title"
    t.text     "sinop"
    t.text     "small"
    t.text     "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vimages", force: :cascade do |t|
    t.text     "url"
    t.integer  "movieu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movieu_id"], name: "index_vimages_on_movieu_id"
  end

end
