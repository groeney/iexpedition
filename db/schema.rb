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

ActiveRecord::Schema.define(version: 20170322114127) do

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
    t.string   "name",                               null: false
    t.text     "overview"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "label"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.float    "price"
    t.boolean  "is_mandatory",       default: false
  end

  create_table "activity_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_activity_groupings_on_activity_id", using: :btree
    t.index ["voyage_id"], name: "index_activity_groupings_on_voyage_id", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "unit"
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "availability",    default: 5, null: false
    t.integer  "discount_amount", default: 0, null: false
    t.index ["cabin_id"], name: "index_cabin_groupings_on_cabin_id", using: :btree
    t.index ["voyage_id"], name: "index_cabin_groupings_on_voyage_id", using: :btree
  end

  create_table "cabins", force: :cascade do |t|
    t.string   "name",                                     null: false
    t.float    "price",                                    null: false
    t.float    "single_supplement",        default: 1.0,   null: false
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "square_meter"
    t.text     "overview"
    t.boolean  "dedicated_sole_occupancy", default: false, null: false
  end

  create_table "contact_requests", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "destination"
    t.datetime "travel_date"
    t.integer  "number_of_people"
    t.text     "message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.float    "discount_amount"
    t.integer  "discount_type",   default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.text     "did_you_know"
    t.text     "voyage_info"
    t.text     "regions_overview"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "relationship"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_emergency_contacts_on_user_id", using: :btree
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

  create_table "favourite_ships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_id"], name: "index_favourite_ships_on_ship_id", using: :btree
    t.index ["user_id"], name: "index_favourite_ships_on_user_id", using: :btree
  end

  create_table "favourite_voyages", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favourite_voyages_on_user_id", using: :btree
    t.index ["voyage_id"], name: "index_favourite_voyages_on_voyage_id", using: :btree
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

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
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

  create_table "operators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "productable_type"
    t.string   "productable_id"
    t.integer  "qty",              default: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "voyage_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "coupon_id"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
    t.index ["voyage_id"], name: "index_orders_on_voyage_id", using: :btree
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "order_item_id"
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "dob"
    t.string   "nationality"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_item_id"], name: "index_passengers_on_order_item_id", using: :btree
  end

  create_table "passports", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "number"
    t.date     "issue_date"
    t.date     "expiry_date"
    t.string   "place_of_birth"
    t.string   "nationality"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "visa_file_name"
    t.string   "visa_content_type"
    t.integer  "visa_file_size"
    t.datetime "visa_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_passports_on_user_id", using: :btree
  end

  create_table "region_groupings", force: :cascade do |t|
    t.integer  "voyage_id"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_region_groupings_on_region_id", using: :btree
    t.index ["voyage_id"], name: "index_region_groupings_on_voyage_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.text     "overview"
    t.integer  "destination_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["destination_id"], name: "index_regions_on_destination_id", using: :btree
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name",                                     null: false
    t.string   "category"
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
    t.string   "outlets"
    t.integer  "open_bridge"
    t.integer  "observation_decks"
    t.integer  "zodiacs"
    t.string   "provided_gear"
    t.boolean  "polar_code_compliant",      default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "operator_id"
    t.integer  "stabilisers"
    t.integer  "draft"
    t.text     "overview_tile"
    t.text     "ix_review"
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.index ["operator_id"], name: "index_ships_on_operator_id", using: :btree
  end

  create_table "travel_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "hotel_name"
    t.text     "hotel_address"
    t.string   "flight_number"
    t.string   "departure_airport"
    t.datetime "departure_date"
    t.string   "arrival_airport"
    t.datetime "arrival_date"
    t.string   "reservation_code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_travel_details_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "nationality"
    t.string   "email",                   default: "",    null: false
    t.string   "phone_number"
    t.text     "requirements"
    t.string   "insurance_company"
    t.string   "insurance_policy_number"
    t.string   "boot_size"
    t.string   "jacket_size"
    t.string   "gender"
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "email_newsletter",        default: false
    t.boolean  "accept_privacy_policy",   default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "voyages", force: :cascade do |t|
    t.integer  "ship_id"
    t.string   "name",                                      null: false
    t.text     "overview"
    t.date     "start_date",                                null: false
    t.date     "end_date",                                  null: false
    t.string   "embark_port"
    t.string   "disembark_port"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "map_file_name"
    t.string   "map_content_type"
    t.integer  "map_file_size"
    t.datetime "map_updated_at"
    t.text     "overview_tile"
    t.integer  "passenger_capacity"
    t.string   "physical_rating"
    t.boolean  "includes_flight",           default: false
    t.integer  "destination_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.float    "gst",                       default: 0.0
    t.string   "currency",                  default: "USD"
    t.index ["destination_id"], name: "index_voyages_on_destination_id", using: :btree
    t.index ["ship_id"], name: "index_voyages_on_ship_id", using: :btree
  end

  create_table "wildlife_groupings", force: :cascade do |t|
    t.integer  "wildlife_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "destination_id"
    t.index ["destination_id"], name: "index_wildlife_groupings_on_destination_id", using: :btree
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

  add_foreign_key "addresses", "users"
  add_foreign_key "emergency_contacts", "users"
  add_foreign_key "facts", "destinations"
  add_foreign_key "favourite_ships", "ships"
  add_foreign_key "favourite_ships", "users"
  add_foreign_key "favourite_voyages", "users"
  add_foreign_key "favourite_voyages", "voyages"
  add_foreign_key "feature_groupings", "features"
  add_foreign_key "gallery_image_groupings", "gallery_images"
  add_foreign_key "highlight_groupings", "highlights"
  add_foreign_key "histories", "destinations"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "coupons"
  add_foreign_key "passengers", "order_items"
  add_foreign_key "passports", "users"
  add_foreign_key "ships", "operators"
  add_foreign_key "travel_details", "users"
  add_foreign_key "voyages", "destinations"
  add_foreign_key "voyages", "ships"
  add_foreign_key "wildlife_groupings", "destinations"
  add_foreign_key "wildlife_groupings", "wildlives"
end
