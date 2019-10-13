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

ActiveRecord::Schema.define(version: 2019_10_12_130449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "claim_histories", force: :cascade do |t|
    t.bigint "ticket_id"
    t.string "claimed_by", null: false
    t.datetime "claimed_at", null: false
    t.integer "claim_quantity", null: false
    t.index ["ticket_id"], name: "index_claim_histories_on_ticket_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "event_info", force: :cascade do |t|
    t.text "synopsis"
    t.text "description"
    t.string "video_link"
    t.integer "year"
    t.index ["year"], name: "index_event_info_on_year", unique: true
  end

  create_table "event_previews", force: :cascade do |t|
    t.string "image_link"
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "preview_info"
    t.index ["year"], name: "index_event_previews_on_year"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "subtitle"
    t.text "overview"
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_events_on_title", unique: true
    t.index ["year"], name: "index_events_on_year", unique: true
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string "question", null: false
    t.text "answer", null: false
  end

  create_table "gallery_photos", force: :cascade do |t|
    t.string "image_link"
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.index ["year"], name: "index_gallery_photos_on_year"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.binary "data", null: false
    t.string "mime_type"
    t.string "filename"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "last_transactions", id: false, force: :cascade do |t|
    t.datetime "time", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.integer "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link", default: "", null: false
    t.index ["year"], name: "index_sponsors_on_year"
  end

  create_table "testimonies", force: :cascade do |t|
    t.string "name", null: false
    t.string "profession", null: false
    t.text "testimony", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "purchased_at", null: false
    t.bigint "customer_id"
    t.string "ticket_type", default: "", null: false
    t.string "booking_reference", default: "", null: false
    t.string "name", default: "", null: false
    t.string "claim_token", default: "", null: false
    t.integer "quantity", null: false
    t.datetime "last_confirmation_email"
    t.index ["booking_reference", "ticket_type"], name: "index_tickets_on_booking_reference_and_ticket_type", unique: true
    t.index ["claim_token"], name: "index_tickets_on_claim_token", unique: true
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "purchased_at", null: false
    t.string "booking_reference", default: "", null: false
    t.string "email", default: "", null: false
    t.string "ticket_type", default: "", null: false
    t.integer "quantity", null: false
    t.string "name", default: "", null: false
    t.index ["booking_reference", "ticket_type"], name: "index_transactions_on_booking_reference_and_ticket_type", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 50, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "claim_histories", "tickets"
  add_foreign_key "event_info", "events", column: "year", primary_key: "year"
  add_foreign_key "event_previews", "events", column: "year", primary_key: "year"
  add_foreign_key "gallery_photos", "events", column: "year", primary_key: "year"
  add_foreign_key "sponsors", "events", column: "year", primary_key: "year"
  add_foreign_key "tickets", "customers"
end
