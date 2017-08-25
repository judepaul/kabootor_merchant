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

ActiveRecord::Schema.define(version: 20170822113838) do

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
    t.text "video_title"
    t.boolean "is_abondon"
    t.text "browser_name"
    t.text "browser_version"
    t.text "js_info"
    t.text "os_name"
    t.text "os_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
