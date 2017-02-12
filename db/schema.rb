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

ActiveRecord::Schema.define(version: 20170212133533) do

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
    t.string   "name",               null: false
    t.text     "overview"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "label"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "price"
  end

  create_table "activity_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_activity_groupings_on_activity_id", using: :btree
    t.index ["voyage_id"], name: "index_activity_groupings_on_voyage_id", using: :btree
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

  create_table "cabin_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "cabin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cabin_id"], name: "index_cabin_groupings_on_cabin_id", using: :btree
    t.index ["voyage_id"], name: "index_cabin_groupings_on_voyage_id", using: :btree
  end

  create_table "cabins", force: :cascade do |t|
    t.string   "name",                             null: false
    t.float    "price",                            null: false
    t.float    "single_supplement",  default: 1.0, null: false
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "square_meter"
    t.text     "overview"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.string   "watermark_image_file_name"
    t.string   "watermark_image_content_type"
    t.integer  "watermark_image_file_size"
    t.datetime "watermark_image_updated_at"
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "exclusion_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "exclusion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["exclusion_id"], name: "index_exclusion_groupings_on_exclusion_id", using: :btree
    t.index ["voyage_id"], name: "index_exclusion_groupings_on_voyage_id", using: :btree
  end

  create_table "exclusions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facts", force: :cascade do |t|
    t.text     "question"
    t.text     "answer"
    t.text     "more_info"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "destination_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["destination_id"], name: "index_facts_on_destination_id", using: :btree
  end

  create_table "feature_groupings", force: :cascade do |t|
    t.integer  "featurable_id"
    t.string   "featurable_type"
    t.integer  "feature_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["feature_id"], name: "index_feature_groupings_on_feature_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallery_image_groupings", force: :cascade do |t|
    t.integer  "gallery_imageable_id"
    t.string   "gallery_imageable_type"
    t.integer  "gallery_image_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["gallery_image_id"], name: "index_gallery_image_groupings_on_gallery_image_id", using: :btree
  end

  create_table "gallery_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "highlight_groupings", force: :cascade do |t|
    t.integer  "highlightable_id"
    t.string   "highlightable_type"
    t.integer  "highlight_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["highlight_id"], name: "index_highlight_groupings_on_highlight_id", using: :btree
  end

  create_table "highlights", force: :cascade do |t|
    t.text     "name"
    t.text     "overview"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "label"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.integer  "destination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_histories_on_destination_id", using: :btree
  end

  create_table "inclusion_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "inclusion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["inclusion_id"], name: "index_inclusion_groupings_on_inclusion_id", using: :btree
    t.index ["voyage_id"], name: "index_inclusion_groupings_on_voyage_id", using: :btree
  end

  create_table "inclusions", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "itinerary_day_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "itinerary_day_id"
    t.integer  "day_number",       null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["itinerary_day_id"], name: "index_itinerary_day_groupings_on_itinerary_day_id", using: :btree
    t.index ["voyage_id"], name: "index_itinerary_day_groupings_on_voyage_id", using: :btree
  end

  create_table "itinerary_days", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.integer  "destination_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["destination_id"], name: "index_regions_on_destination_id", using: :btree
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "operator_name"
    t.string   "category"
    t.string   "currency",                             null: false
    t.integer  "payment_prior"
    t.text     "recommendation_text"
    t.integer  "passenger_capacity"
    t.integer  "luxury_star_rating"
    t.integer  "crew_number"
    t.string   "ice_class"
    t.integer  "speed"
    t.date     "year_refurbished"
    t.date     "year_built"
    t.integer  "length"
    t.integer  "width"
    t.integer  "tonnage"
    t.integer  "registry"
    t.integer  "engines"
    t.integer  "outlets",              default: 0
    t.boolean  "open_bridge",          default: false
    t.integer  "observation_decks"
    t.integer  "zodiacs"
    t.string   "provided_gear"
    t.boolean  "polar_code_compliant", default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "voyages", force: :cascade do |t|
    t.integer  "ship_id"
    t.string   "name",                                null: false
    t.text     "overview"
    t.date     "start_date",                          null: false
    t.date     "end_date",                            null: false
    t.string   "embark_port"
    t.string   "disembark_port"
    t.integer  "discount_percentage", default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
    t.text     "overview_tile"
    t.integer  "passenger_capacity"
    t.string   "physical_rating"
    t.boolean  "includes_flight",     default: false
    t.integer  "destination_id"
    t.integer  "region_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["destination_id"], name: "index_voyages_on_destination_id", using: :btree
    t.index ["region_id"], name: "index_voyages_on_region_id", using: :btree
    t.index ["ship_id"], name: "index_voyages_on_ship_id", using: :btree
  end

  create_table "wildlife_groupings", force: :cascade do |t|
    t.integer  "wildlifable_id"
    t.string   "wildlifable_type"
    t.integer  "wildlife_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["wildlife_id"], name: "index_wildlife_groupings_on_wildlife_id", using: :btree
  end

  create_table "wildlives", force: :cascade do |t|
    t.text     "name"
    t.text     "overview"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "label"
    t.text     "fact"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "facts", "destinations"
  add_foreign_key "feature_groupings", "features"
  add_foreign_key "gallery_image_groupings", "gallery_images"
  add_foreign_key "highlight_groupings", "highlights"
  add_foreign_key "histories", "destinations"
  add_foreign_key "voyages", "destinations"
  add_foreign_key "voyages", "regions"
  add_foreign_key "voyages", "ships"
  add_foreign_key "wildlife_groupings", "wildlives"
end
