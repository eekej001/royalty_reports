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

ActiveRecord::Schema.define(version: 20171101203503) do

  create_table "artists", force: :cascade do |t|
    t.string   "e_name",     limit: 50, null: false
    t.string   "j_name",     limit: 50, null: false
    t.string   "email",      limit: 50, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "doujinshis", force: :cascade do |t|
    t.string   "title",      limit: 50, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "forms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "first_name", limit: 50, null: false
    t.string   "last_name",  limit: 50, null: false
    t.string   "email",      limit: 50, null: false
    t.string   "title",      limit: 90, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "artist_id",  limit: 4
    t.integer  "title_id",   limit: 4
    t.string   "first_name", limit: 90,                         null: false
    t.string   "last_name",  limit: 90,                         null: false
    t.string   "email",      limit: 50,                         null: false
    t.string   "format",     limit: 90,                         null: false
    t.decimal  "price",                 precision: 5, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "sales", ["artist_id", "title_id"], name: "index_sales_on_artist_id_and_title_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", limit: 255, null: false
    t.string   "shopify_token",  limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true, using: :btree

  create_table "titles", force: :cascade do |t|
    t.integer  "artist_id",  limit: 4
    t.string   "j_title",    limit: 50,                         null: false
    t.string   "e_title",    limit: 50,                         null: false
    t.decimal  "srp",                   precision: 5, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "titles", ["artist_id"], name: "index_titles_on_artist_id", using: :btree

end
