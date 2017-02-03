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

ActiveRecord::Schema.define(version: 20170201185341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "activities", force: :cascade do |t|
    t.integer  "voyage_id"
    t.string   "name",        null: false
    t.string   "description"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["voyage_id"], name: "index_activities_on_voyage_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "cabins", force: :cascade do |t|
    t.string   "name",                            null: false
    t.float    "price",                           null: false
    t.float    "single_supplement", default: 1.0, null: false
    t.integer  "voyage_id"
    t.string   "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["voyage_id"], name: "index_cabins_on_voyage_id", using: :btree
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
