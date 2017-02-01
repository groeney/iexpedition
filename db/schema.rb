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

ActiveRecord::Schema.define(version: 20170201181452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "voyage_id"
    t.string   "name",        null: false
    t.string   "description"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["voyage_id"], name: "index_activities_on_voyage_id", using: :btree
  end

  create_table "cabins", force: :cascade do |t|
    t.integer  "voyage_id"
    t.string   "class",                           null: false
    t.float    "price",                           null: false
    t.float    "single_supplement", default: 1.0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["voyage_id"], name: "index_cabins_on_voyage_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "operator_name"
    t.string   "category"
    t.string   "currency",      null: false
    t.integer  "payment_prior"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "voyages", force: :cascade do |t|
    t.integer  "ship_id"
    t.string   "name",                            null: false
    t.string   "overview"
    t.date     "start_date",                      null: false
    t.date     "end_date",                        null: false
    t.string   "embark_port"
    t.string   "disembark_port"
    t.integer  "discount_percentage", default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["ship_id"], name: "index_voyages_on_ship_id", using: :btree
  end

  add_foreign_key "activities", "voyages"
  add_foreign_key "cabins", "voyages"
  add_foreign_key "voyages", "ships"
end
