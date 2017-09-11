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

ActiveRecord::Schema.define(version: 20170911134023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "reason"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visitor_id"
    t.string "tenant_id"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["visitor_id"], name: "index_users_on_visitor_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.text "temp_tenant_id"
    t.text "media_server_session_id"
    t.text "media_server_name"
    t.text "media_server_project_id"
    t.text "availability_status"
    t.text "storage_provider_resource_id"
    t.text "storage_provider_access_key_id"
    t.text "storage_provider_access_signature"
    t.text "storage_provider_name"
    t.text "storage_provider_status"
    t.text "resource_type"
    t.text "resource_availability_status"
    t.text "resource_uri"
    t.integer "resource_size"
    t.integer "resource_length"
    t.text "sender_email"
    t.text "industry_name"
    t.text "receiver_name"
    t.text "receiver_email"
    t.text "receiver_phone"
    t.text "poster_image_filename"
    t.text "poster_image_location"
    t.text "poster_image_status"
    t.boolean "is_abondon"
    t.text "browser_name"
    t.text "browser_version"
    t.text "js_info"
    t.text "os_name"
    t.text "os_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "video_title"
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "users", "visitors"
end
