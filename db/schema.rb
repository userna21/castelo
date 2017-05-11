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

ActiveRecord::Schema.define(version: 20170505090744) do

  create_table "aimages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535
    t.integer  "awsub_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["awsub_id"], name: "index_aimages_on_awsub_id", using: :btree
  end

  create_table "awsubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "sinop",      limit: 65535
    t.text     "asmall",     limit: 65535
    t.text     "amedium",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug"
    t.index ["slug"], name: "index_awsubs_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: { slug: 70, scope: 70 }, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 140 }, using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "limages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535
    t.integer  "same_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["same_id"], name: "index_limages_on_same_id", using: :btree
  end

  create_table "melodies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mtitle"
    t.text     "msinop",     limit: 65535
    t.text     "msmall",     limit: 65535
    t.text     "mmedium",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "dstream",    limit: 65535
    t.string   "slug"
    t.index ["slug"], name: "index_melodies_on_slug", unique: true, using: :btree
  end

  create_table "mimages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535
    t.integer  "melody_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["melody_id"], name: "index_mimages_on_melody_id", using: :btree
  end

  create_table "movieus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "gstream",    limit: 65535
    t.text     "nstream",    limit: 65535
    t.text     "lstream",    limit: 65535
    t.text     "mstream",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug"
    t.index ["slug"], name: "index_movieus_on_slug", unique: true, using: :btree
  end

  create_table "oimages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",         limit: 65535
    t.integer  "oploverz_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["oploverz_id"], name: "index_oimages_on_oploverz_id", using: :btree
  end

  create_table "oploverzs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "sinops",      limit: 65535
    t.text     "small",       limit: 65535
    t.text     "medium",      limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "visit_count",               default: 0, null: false
    t.string   "slug"
    t.index ["slug"], name: "index_oploverzs_on_slug", unique: true, using: :btree
  end

  create_table "ostreams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "link",        limit: 65535
    t.integer  "oploverz_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["oploverz_id"], name: "index_ostreams_on_oploverz_id", using: :btree
  end

  create_table "sames", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "lsmall1",    limit: 65535
    t.text     "lsmall2",    limit: 65535
    t.text     "lmedium1",   limit: 65535
    t.text     "lmedium2",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug"
    t.index ["slug"], name: "index_sames_on_slug", unique: true, using: :btree
  end

  create_table "timages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535
    t.integer  "tonan_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["tonan_id"], name: "index_timages_on_tonan_id", using: :btree
  end

  create_table "tonans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "sinop",      limit: 65535
    t.text     "small",      limit: 65535
    t.text     "medium",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug"
    t.index ["slug"], name: "index_tonans_on_slug", unique: true, using: :btree
  end

  create_table "vimages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535
    t.integer  "movieu_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["movieu_id"], name: "index_vimages_on_movieu_id", using: :btree
  end

  add_foreign_key "aimages", "awsubs"
  add_foreign_key "limages", "sames"
  add_foreign_key "mimages", "melodies"
  add_foreign_key "oimages", "oploverzs"
  add_foreign_key "ostreams", "oploverzs"
  add_foreign_key "timages", "tonans"
  add_foreign_key "vimages", "movieus"
end
